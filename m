Return-Path: <linux-gpio+bounces-5789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AC8AF669
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 20:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2F02B22E31
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 18:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD4B13E3EB;
	Tue, 23 Apr 2024 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtB1ckJU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8B13D8BA
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713896248; cv=none; b=nTv+bf35sm96baUrpvb8SScO2DrOuti5dSjsj+9wg85H44d3IYi9TK8TGq6bguPrLjH7az3uWDSPo7/8ItoI6fSj+oPVVrfxyc41sBY6Vt6Ei94+StUIgisPiLd6kJ57XVCN2U62KD1A/RAXKBNz9o8Vlvh/aHKXz98XAuzHSwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713896248; c=relaxed/simple;
	bh=nB1WFgrjIRF4QE93JRr5n7kGisb2jqMYTfhhuXr5ln0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/NmR0ftrXfA9Sfw7wpNurByiaFNJCunSL2ZSOCM9GPCQWM+4an+fy3/40V74YTm9KH1IQiapIi15/E9bREjtP9YizBO6fT3Enbk2E7aNl8Lw4HQuLoCWvBXzQAFYIEimIxxvyKR1FNKa2sE5fyFEF3ah8ub/914BouFxTWGF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtB1ckJU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713896247; x=1745432247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nB1WFgrjIRF4QE93JRr5n7kGisb2jqMYTfhhuXr5ln0=;
  b=HtB1ckJUXa9zxxAQxCUqNUphZfAhhRCXbvEgd3NbAQ1pVfoFWiChnyV+
   D/kcRC2tfUc9BJ7KvC7e8+kEgcqMwacsrfIW04J8h28xu+sqcsx/Ey9IF
   4krmbVIWa52D6+yR5laq0XCGxN1jWwFD0VibaJD5gJJGqdyiH97J6uFKQ
   CMcBiXFqdyYkPiFLZD831vngJKhAV4oRShLPazS2aVfNuXFOA0Tfp5FJD
   uCOiUlMsA1yhnPZFD9ft+gyN0ePUOA2mFfQyQ5d9G2C3GuiKVTXDN8dAw
   Qd7Gj+y2eZhxVWDYrq9oPYCj4OEtciPOxvlEo1zia3EKE+lL3Q8tz3jHL
   Q==;
X-CSE-ConnectionGUID: 1pOkr84RQvCTnYSLSyigZQ==
X-CSE-MsgGUID: IbEMiNl7QIGni9vdSPcuzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9716991"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9716991"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 11:17:26 -0700
X-CSE-ConnectionGUID: eLw5VlYoRKmhw+f4KLDSLw==
X-CSE-MsgGUID: bFxbTFbNRQG1OjWyHyeODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28937606"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 11:17:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzKhl-00000000Qjv-3kv9;
	Tue, 23 Apr 2024 21:17:21 +0300
Date: Tue, 23 Apr 2024 21:17:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][RFC/RFT 02/18] tests: split out the common test code
 for bash scripts
Message-ID: <Zif7McOO-1d2coCO@smile.fi.intel.com>
References: <20240412122804.109323-1-brgl@bgdev.pl>
 <20240412122804.109323-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412122804.109323-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 12, 2024 at 02:27:48PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In order to allow the upcoming DBus command-line client tests to reuse the
> existing bash test harness, let's put the common code into an importable
> file and rename run_tool to run_prog to reflect that it now can run any
> program.

>  tests/bash/Makefile.am                |   4 +
>  tests/bash/gpiod-bash-test-helper.inc | 328 +++++++++++++++

Is the 'bash' a new folder name?

If so, it might be problematic for make as it may recognize it as a bash
command. I would rather name it 'scripts' or 'shell' or alike.

...

> +++ b/tests/bash/gpiod-bash-test-helper.inc

And why not a simple shell? Do you use bashisms?

...

> +# Run the command in $* and fail the test if the command succeeds.

"$*" in most cases is simply wrong. "$@" is better.

https://unix.stackexchange.com/questions/294052/how-to-properly-pass-set-of-parameters-with-spaces-into-shell-function

...

> +num_lines_is() {
> +	[ "$1" -eq "0" ] || [ -z "$output" ] && return 0

-o inside [] will do better than ||

> +	local NUM_LINES=$(echo "$output" | wc -l)
> +	assertEquals " number of lines:" "$1" "$NUM_LINES"
> +}

...

> +	for ARG in $*

This may be wrong.

> +	do

> +	done

...

> +gpiosim_chip_symlink_cleanup() {
> +	if [ -n "$GPIOSIM_CHIP_LINK" ]
> +	then
> +		rm "$GPIOSIM_CHIP_LINK"
> +	fi

If you use already || or && you may continue doing that, this will be one liner
with it.

	[ -n "$GPIOSIM_CHIP_LINK" ] && rm "$GPIOSIM_CHIP_LINK"

> +	unset GPIOSIM_CHIP_LINK
> +}

...

> +	for i in {1..30}; do

$(seq 1 30) or IIRC $(seq 30)

Less bashisms are better.

> +		[ "$(<$PORT)" = "$EXPECTED" ] && return
> +		sleep 0.01
> +	done

...

> +		if [ "$?" = "0" ]
> +		then
> +			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")

What's the point in -E ?

Yet another `Useless use of grep`.

IIRC how `find` works. You may filter names there (and with regex IIRC again).

> +			do
> +				test -e $LINE/hog && rmdir $LINE/hog

Why not [ -e ... ] && ?

> +				rmdir $LINE
> +			done
> +		fi

...

> +dut_read_redirect() {
> +	output=$(<$SHUNIT_TMPDIR/$DUT_OUTPUT)
> +        local ORIG_IFS="$IFS"
> +        IFS=$'\n' lines=($output)
> +        IFS="$ORIG_IFS"

TABs vs. spaces indentation issues?

> +}

...

> +dut_read() {
> +	local LINE
> +	lines=()
> +	while read -t 0.2 -u ${COPROC[0]} LINE;

What is ; for as you are using three-lines form?

> +	do
> +		if [ -n "$DUT_FIRST_CHAR" ]
> +		then
> +			LINE=${DUT_FIRST_CHAR}${LINE}
> +			unset DUT_FIRST_CHAR
> +		fi
> +		lines+=("$LINE")

Don't remember the syntax, but something like this

lines=$((LINE + $lines))

is better than bashisms.

> +	done
> +	output="${lines[@]}"
> +}

...

> +	read -t 0.2 -u ${COPROC[0]} LINE || (echo Timeout && false)

Wouldn't () fork a shell?
(The () vs. {} discussion, don't remember by heart though.)

...

> +dut_write() {
> +	echo $* >&${COPROC[1]}

Oh.

> +}

...

> +# Must be done after we sources shunit2 as we need SHUNIT_VERSION to be set.
> +oneTimeSetUp() {
> +	test "$SHUNIT_VERSION" = "$MIN_SHUNIT_VERSION" && return 0
> +	local FIRST=$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" | sort -Vr | head -1)

I believe you can do it with a simple test rather than involving sort and head
and printf. And test most likely will be builtin.

> +	test "$FIRST" = "$MIN_SHUNIT_VERSION" && \
> +		die "minimum shunit version required is $MIN_SHUNIT_VERSION (current version is $SHUNIT_VERSION"
> +}

...

> +	SORTED=$(printf "$REQUIRED\n$CURRENT" | sort -V | head -n 1)

Ditto.

> +	if [ "$SORTED" != "$REQUIRED" ]

Dup? Seems to me you can run a single test to get the answer.

> +	then
> +		die "linux kernel version must be at least: v$REQUIRED - got: v$CURRENT"

Linux

> +	fi

...

Okay, it seems you moved existing code... That code needs more love towards
becoming a nicely formatted shell.

-- 
With Best Regards,
Andy Shevchenko



