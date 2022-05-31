Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA36538F17
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 12:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239573AbiEaKch (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 06:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343513AbiEaKcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 06:32:35 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750BB95A12
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 03:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653993153; x=1685529153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNsKhAAzvElHv8ppxPArchCpw+Bis50zP2db0e6ff1o=;
  b=f5wqsxbLZuz7LwxU66ib2KRi0Cu+5jx67qg5tHel81Nb2L2jDaQcvJTA
   VvI1YupvjCTz1p3hAqAgIOTdZCIT+mLv3WdG66RVFEg1QA2OOkM9RVDs/
   sGen31F40tIEWckKmmQywP4442uvWym6cV/eNqmDlXTx8V6Lp7zTDLufJ
   X96/e3ZJ79lBNfAIw9rWCTTTZ9+Xm2n6yPqapLmNBxGRBxIQ0ySch4j2j
   wd4xEuhXba1i3F9zkAeowvm8fXJ5P+cv5a7aZFSVQnMYHQ8OX0WI7cdgm
   FJgqqdcHqLLR8UNl9VG+4MNFPBvUDPX+NaMfXqKATYFdvxpHO0VSfgcJ3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="275218418"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="275218418"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:32:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="632981368"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:32:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nvzAq-000Phi-Ug;
        Tue, 31 May 2022 13:32:28 +0300
Date:   Tue, 31 May 2022 13:32:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v3 6/6] pinctrl: amd: Implement pinmux functionality
Message-ID: <YpXuvG04euX/rZr7@smile.fi.intel.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-7-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084322.1310250-7-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 02:13:22PM +0530, Basavaraj Natikar wrote:
> Provide pinmux functionality by implementing pinmux_ops.

...

> +static int amd_set_mux(struct pinctrl_dev *pctrldev, unsigned int function, unsigned int group)
> +{
> +	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctrldev);

Consider to use

	struct device *dev = ...;

and make code few lines shorter.

> +	struct pin_desc *pd;
> +	int ind, index;
> +
> +	if (!gpio_dev->iomux_base)
> +		return -EINVAL;
> +
> +	for (index = 0; index < NSELECTS; index++) {
> +		if (strcmp(gpio_dev->groups[group].name,  pmx_functions[function].groups[index]))
> +			continue;
> +
> +		if (readb(gpio_dev->iomux_base + pmx_functions[function].index) ==
> +				FUNCTION_INVALID) {
> +			dev_warn(&gpio_dev->pdev->dev,
> +				 "IOMUX_GPIO 0x%x not present or supported\n",
> +				 pmx_functions[function].index);
> +			return -EINVAL;
> +		}
> +
> +		writeb(index, gpio_dev->iomux_base + pmx_functions[function].index);
> +
> +		if (index != (readb(gpio_dev->iomux_base + pmx_functions[function].index) &
> +					FUNCTION_MASK)) {
> +			dev_warn(&gpio_dev->pdev->dev,
> +				 "IOMUX_GPIO 0x%x not present or supported\n",
> +				 pmx_functions[function].index);
> +			return -EINVAL;
> +		}
> +
> +		for (ind = 0; ind < gpio_dev->groups[group].npins; ind++) {
> +			if (strncmp(gpio_dev->groups[group].name, "IMX_F", strlen("IMX_F")))
> +				continue;
> +
> +			pd = pin_desc_get(gpio_dev->pctrl, gpio_dev->groups[group].pins[ind]);
> +			pd->mux_owner = gpio_dev->groups[group].name;
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +}

...

> +#define AMD_PINCTRL_FUNC_GRP(_number, _func)						\
> +	[IMX_F##_func##_GPIO##_number] = PINCTRL_GRP("IMX_F"#_func "_GPIO"#_number,	\
> +						     AMD_PINS(_number), 1)

Slightly better:

#define AMD_PINCTRL_FUNC_GRP(_number, _func)					\
	[IMX_F##_func##_GPIO##_number] =					\
		PINCTRL_GRP("IMX_F"#_func "_GPIO"#_number, AMD_PINS(_number), 1)

...

> +#define AMD_PMUX_FUNC(_number) {						\
> +	.name = "iomux_gpio_"#_number,						\
> +	.groups = { "IMX_F0_GPIO"#_number, "IMX_F1_GPIO"#_number,		\
> +		    "IMX_F2_GPIO"#_number, "IMX_F3_GPIO"#_number },		\
> +	.index = _number,							\
> +	.ngroups = NSELECTS,							\
> +}

Slightly better (indentation, comma):

#define AMD_PMUX_FUNC(_number) {				\
	.name = "iomux_gpio_"#_number,				\
	.groups = {						\
		"IMX_F0_GPIO"#_number, "IMX_F1_GPIO"#_number,	\
		"IMX_F2_GPIO"#_number, "IMX_F3_GPIO"#_number,	\
	},							\
	.index = _number,					\
	.ngroups = NSELECTS,					\
}

-- 
With Best Regards,
Andy Shevchenko


