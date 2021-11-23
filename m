Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 465BB45AB71
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 19:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237313AbhKWSu2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 13:50:28 -0500
Received: from mga01.intel.com ([192.55.52.88]:33936 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234139AbhKWSu2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 13:50:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="258977198"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="258977198"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 10:46:01 -0800
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="674590629"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 10:45:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mpanj-009s1P-3i;
        Tue, 23 Nov 2021 20:45:55 +0200
Date:   Tue, 23 Nov 2021 20:45:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YZ024q/r7Hc3TpMt@smile.fi.intel.com>
References: <20211123164902.35370-1-wsa+renesas@sang-engineering.com>
 <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 05:49:02PM +0100, Wolfram Sang wrote:
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.

...

> +Result is a .sr file to be consumed with PulseView or sigrok-cli from the free
> +`sigrok`_ project. It is a zip file which also contains the binary sample data
> +which may be consumed by other software. The filename is the logic analyzer
> +instance name plus a since-epoch timestamp.
> +
> +.. _sigrok: https://sigrok.org/

Alas, yet another tool required... (Sad thoughts since recently has installed
PicoScope software).

...

>     kgdb
>     kselftest
>     kunit/index

> +   gpio-sloppy-logic-analyzer

Above looks like ordered, do we need some groups here or so?

...

> +	mutex_lock(&priv->lock);

> +	if (priv->blob_dent) {

Redundant (i.e. duplicate).

> +		debugfs_remove(priv->blob_dent);
> +		priv->blob_dent = NULL;
> +	}

...

> +gpio_err:

A bit confusing name. What about

enable_irq_and_free_data:

?

> +	preempt_enable_notrace();
> +	local_irq_enable();
> +	if (ret)
> +		dev_err(priv->dev, "couldn't read GPIOs: %d\n", ret);
> +
> +	kfree(priv->trig_data);
> +	priv->trig_data = NULL;
> +	priv->trig_len = 0;

...

> +static int gpio_la_poll_probe(struct platform_device *pdev)
> +{
> +	struct gpio_la_poll_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	const char *devname = dev_name(dev);
> +	const char *gpio_names[GPIO_LA_MAX_PROBES];

> +	char *meta = NULL;
> +	unsigned int i, meta_len = 0;
> +	int ret;

Perhaps

	unsigned int i, meta_len = 0;
	char *meta = NULL;
	int ret;


...

> +	ret = device_property_read_string_array(dev, "probe-names", gpio_names,
> +						priv->descs->ndescs);
> +	if (ret >= 0 && ret != priv->descs->ndescs)

> +		ret = -ENODATA;

Don't remember if we already discussed this error code, but data is there,
it's not correct. EBADSLT? EBADR? ECHRNG?

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "error naming the GPIOs");

...

> +	for (i = 0; i < priv->descs->ndescs; i++) {
> +		unsigned int add_len;
> +		char *new_meta, *consumer_name;
> +
> +		if (gpiod_cansleep(priv->descs->desc[i]))
> +			return -EREMOTE;
> +
> +		consumer_name = kasprintf(GFP_KERNEL, "%s: %s", devname, gpio_names[i]);
> +		if (!consumer_name)
> +			return -ENOMEM;
> +		gpiod_set_consumer_name(priv->descs->desc[i], consumer_name);
> +		kfree(consumer_name);
> +
> +		/* '10' is length of 'probe00=\n\0' */
> +		add_len = strlen(gpio_names[i]) + 10;
> +
> +		new_meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);
> +		if (!new_meta)
> +			return -ENOMEM;
> +
> +		meta = new_meta;
> +		meta_len += snprintf(meta + meta_len, add_len, "probe%02u=%s\n",
> +				     i + 1, gpio_names[i]);

Do we really need the 'probe%02u=' part? It's redundant since it may be derived
from the line number of the output (and it always in [1..ndescs+1]).

> +	}

...

> +	dev_info(dev, "initialized");

Is it useful?

...

> +print_help()
> +{
> +	cat <<EOF

	cat << EOF

is slightly easier to read.

> +EOF
> +}

...

> +set_newmask()
> +{
> +	for f in $(find "$1" -iname "$2"); do echo "$newmask" > "$f" 2>/dev/null || true; done

While here it's okay, the rule of thumb is never use `for` or `while` against
the list of filenames.

> +}

...

> +init_cpu()
> +{
> +	isol_cpu="$1"

> +	[ -d $cpusetdir ] || mkdir $cpusetdir

`mkdir -p` and drop needless test.

> +	mount | grep -q $cpusetdir || mount -t cpuset cpuset $cpusetdir

> +	[ -d "$lacpusetdir" ] || mkdir "$lacpusetdir"

`mkdir -p` and drop needless test.

> +	cur_cpu="$(cat "$lacpusetdir"/cpus)"
> +	[ "$cur_cpu" = "$isol_cpu" ] && return
> +	[ -z "$cur_cpu" ] || fail "CPU$isol_cpu requested but CPU$cur_cpu already isolated"
> +
> +	echo "$isol_cpu" > "$lacpusetdir"/cpus || fail "Could not isolate CPU$isol_cpu. Does it exist?"
> +	echo 1 > "$lacpusetdir"/cpu_exclusive
> +	echo 0 > "$lacpusetdir"/mems
> +
> +	oldmask=$(cat /proc/irq/default_smp_affinity)

> +	val=$((0x$oldmask & ~(1 << isol_cpu)))
> +	newmask=$(printf "%x" $val)

Can be on one line (in a single expression).

> +	set_newmask '/proc/irq' '*smp_affinity'
> +	set_newmask '/sys/devices/virtual/workqueue/' 'cpumask'
> +
> +	# Move tasks away from isolated CPU
> +	for p in $(ps -o pid | tail -n +2); do
> +		mask=$(taskset -p "$p") || continue
> +		# Ignore tasks with a custom mask, i.e. not equal $oldmask
> +		[ "${mask##*: }" = "$oldmask" ] || continue
> +		taskset -p "$newmask" "$p" || continue
> +	done 2>/dev/null >/dev/null

`> /dev/null 2>&1` is idiomatic. And I think there is actually a subtle
difference between two.

> +	echo 1 > /sys/module/rcupdate/parameters/rcu_cpu_stall_suppress
> +
> +	cpufreqgov="/sys/devices/system/cpu/cpu$isol_cpu/cpufreq/scaling_governor"
> +	[ -w "$cpufreqgov" ] && echo 'performance' > "$cpufreqgov" || true
> +}

...

> +parse_triggerdat()
> +{
> +	oldifs="$IFS"
> +	IFS=','; for trig in $1; do
> +		mask=0; val1=0; val2=0
> +		IFS='+'; for elem in $trig; do
> +			chan=${elem%[lhfrLHFR]}
> +			mode=${elem#$chan}
> +			# Check if we could parse something and the channel number fits

> +			[ "$chan" != "$elem" ] && [ "$chan" -le $max_chans ] || fail "Trigger syntax error: $elem"

No need to execute `test` twice:

			[ "$chan" != "$elem" -a "$chan" -le $max_chans ] || fail "Trigger syntax error: $elem"

> +			bit=$((1 << (chan - 1)))
> +			mask=$((mask | bit))
> +			case $mode in
> +				[hH]) val1=$((val1 | bit)); val2=$((val2 | bit));;
> +				[fF]) val1=$((val1 | bit));;
> +				[rR]) val2=$((val2 | bit));;
> +			esac
> +		done

> +		trigger_bindat="$trigger_bindat$(printf '\\%o\\%o' $mask $val1)"
> +		[ $val1 -ne $val2 ] && trigger_bindat="$trigger_bindat$(printf '\\%o\\%o' $mask $val2)"

`printf` with arguments may be split to a separate helper function.

> +	done
> +	IFS="$oldifs"
> +}
> +
> +do_capture()
> +{
> +	taskset "$1" echo 1 > "$lasysfsdir"/capture || fail "Capture error! Check kernel log"

Shouldn't this function setup signal TRAPs?

> +	srtmp=$(mktemp -d)
> +	echo 1 > "$srtmp"/version
> +	cp "$lasysfsdir"/sample_data "$srtmp"/logic-1-1
> +	cat > "$srtmp"/metadata <<EOF

	cat > "$srtmp"/metadata << EOF

> +[global]
> +sigrok version=0.2.0
> +
> +[device 1]
> +capturefile=logic-1
> +total probes=$(wc -l < "$lasysfsdir"/meta_data)
> +samplerate=${samplefreq}Hz
> +unitsize=1
> +EOF
> +	cat "$lasysfsdir"/meta_data >> "$srtmp"/metadata
> +
> +	zipname="$outputdir/${lasysfsdir##*/}-$(date +%s).sr"
> +	zip -jq "$zipname" "$srtmp"/*
> +	rm -rf "$srtmp"
> +	delay_ack=$(cat "$lasysfsdir"/delay_ns_acquisition)
> +	[ "$delay_ack" -eq 0 ] && delay_ack=1
> +	echo "Logic analyzer done. Saved '$zipname'"
> +	echo "Max sample frequency this time: $((1000000000 / delay_ack))Hz."
> +}
> +
> +rep=$(getopt -a -l cpu:,duration-us:,help,instance:,kernel-debug-dir:,num_samples:,output-dir:,sample_freq:,trigger: -o c:d:hi:k:n:o:s:t: -- "$@") || exit 1
> +eval set -- "$rep"
> +while true; do
> +	case "$1" in
> +	-c|--cpu) initcpu="$2"; shift;;
> +	-d|--duration-us) duration="$2"; shift;;
> +	-h|--help) print_help; exit 0;;
> +	-i|--instance) lainstance="$2"; shift;;
> +	-k|--kernel-debug-dir) debugdir="$2"; shift;;
> +	-n|--num_samples) numsamples="$2"; shift;;
> +	-o|--output-dir) outputdir="$2"; shift;;
> +	-s|--sample_freq) samplefreq="$2"; shift;;
> +	-t|--trigger) triggerdat="$2"; shift;;
> +	--) break;;

> +	*) fail "error parsing command line: $*";;

$@ is better, actually one should never use $*.

> +	esac
> +	shift
> +done

...

Wondering, shouldn't be a simple validator before start that we have commands
present, such as zip?

-- 
With Best Regards,
Andy Shevchenko


