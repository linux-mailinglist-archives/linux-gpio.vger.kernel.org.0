Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B0960E13D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 14:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbiJZMxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 08:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233919AbiJZMxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 08:53:46 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABD7F5CEC
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666788826; x=1698324826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B5rubBoY7gcrNO9YOrzyyfOVtNHKx4bFR7SoaOzcN8I=;
  b=NFEXeho/U2pziFxago5QOUkb/99cMCgRJzd7HEU/dKPPzUZWD3uG05Z8
   sNsueCOMATst/sPshmINBYPuSCigmAtqnSKIyF0DXl1UUgvIp6N9aXeL6
   04NRSLNDPKK5SbeG4dPelH1FuoIyKk3ctcQl0vhpE9dfQRe0/tJSqIXy+
   kSQCF01Z+2Kk0tcNcIg0UMsBrZU4w8ryxFNvb2ze7/pUFoyKS4X21N8EG
   PDbe4C/Iy3hYB4gLw5Sf3hwKnt80RIYQKAAIoRCHd2bAoWN0gjXzW1Rjx
   pM7qrO/FmQTnxewOHqknHNVS7NfralvJeK80J8LWyCyrOnwgaWIAJF+RE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288332296"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="288332296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="774573766"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="774573766"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2022 05:53:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onfuh-002eRX-0R;
        Wed, 26 Oct 2022 15:53:43 +0300
Date:   Wed, 26 Oct 2022 15:53:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 2/4] bindings: python: add examples
Message-ID: <Y1kt1iHYpbZGaND4@smile.fi.intel.com>
References: <20221026123425.498912-1-brgl@bgdev.pl>
 <20221026123425.498912-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026123425.498912-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 02:34:23PM +0200, Bartosz Golaszewski wrote:
> This adds the regular set of example programs implemented using libgpiod
> python bindings.

...

> +if __name__ == "__main__":
> +    for chip in gpio_chips():
> +        info = chip.get_info()
> +        print("{} [{}] ({} lines)".format(info.name, info.label, info.num_lines))

In all of them I would prefer to see the main() explicitly, like

def main():
	...

if __name__ == "__main__":
    main()

(In this case the module can be imported by another one and main be reused)

Also have you considered use of SystemExit() wrapper?

...

> +                    sys.exit(0)
> +
> +    sys.exit(1)

Is it in the original C code?!
I would expect that no chips -- no error.

...

> +if __name__ == "__main__":
> +    if len(sys.argv) < 3:
> +        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")

	SystemExit(main(sys.argv)) ?

> +    path = sys.argv[1]
> +    lines = [int(line) if line.isdigit() else line for line in sys.argv[2:]]
> +
> +    request = gpiod.request_lines(
> +        path,
> +        consumer="gpioget.py",
> +        config={tuple(lines): gpiod.LineSettings(direction=Direction.INPUT)},
> +    )
> +
> +    vals = request.get_values()
> +
> +    for val in vals:
> +        print("{} ".format(val.value), end="")

> +    print()

Without any conditional it will print an empty line, was it originally in the C
variant?

-- 
With Best Regards,
Andy Shevchenko


