Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAD5516E78
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 13:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384686AbiEBLEs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 07:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376723AbiEBLEg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 07:04:36 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A51DCD
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651489258; x=1683025258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzdK7ecc8Zu2bNvo5ux0Jj+SvazieoQXeBrJipks1Ik=;
  b=F/5ZIkWuxDf+KG3IpM06CzotsNSUNNf4TdD1RBXttwstMXQ59VKyPODR
   LLVzwV/NXuXsWY7eav4I1kNeP2XxMdIPr6mozRMh9ldaPufUknPBgXqsU
   a9esILm5G4IJYn4wBpNtw0IYJxE6G0YoGeZFCy0nXDN6tpTisPVFze95u
   vq9TA/o3t3+k2xN9DhtNzvW/G0G63Tv6Reja+l1qZbnUx9Wyxfa1yIA3V
   WoExJ+xOSU7FGtDCps9DgsZxzp75Tt5FbC6xJYt/SuUczfoxW3sLxuso4
   KoUSS6cHmeljuJY0qyrJFmRqSfot0coNJc5/H428nwxLXsryXsUjLeM4Z
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="327721136"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="327721136"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 04:00:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="690076739"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 04:00:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nlTnR-00B1DN-Pv;
        Mon, 02 May 2022 14:00:53 +0300
Date:   Mon, 2 May 2022 14:00:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] MAINTAINERS: update the GPIO git tree entry
Message-ID: <Ym+55dJDxUKBeG5y@smile.fi.intel.com>
References: <20220502093416.22744-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502093416.22744-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 02, 2022 at 11:34:16AM +0200, Bartosz Golaszewski wrote:
> My git tree has become the de facto main GPIO tree. Update the
> MAINTAINERS file to reflect that.

Indeed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index edc96cdb85e8..9d47c5e7c6ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8385,7 +8385,7 @@ M:	Linus Walleij <linus.walleij@linaro.org>
>  M:	Bartosz Golaszewski <brgl@bgdev.pl>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>  F:	Documentation/ABI/obsolete/sysfs-gpio
>  F:	Documentation/ABI/testing/gpio-cdev
>  F:	Documentation/admin-guide/gpio/
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


