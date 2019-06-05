Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106E235748
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 08:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfFEG7q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 02:59:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38590 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfFEG7q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 02:59:46 -0400
Received: by mail-pf1-f194.google.com with SMTP id a186so13580770pfa.5
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kyvvb8Dpo+7r/hNh0Hasg4c/obIxKq733Zz2TyhyGfk=;
        b=hnjKuAO+7okYKXT89T/HbjNHxzesqyxbmXGKeWw/M0zwLzOfJJzpKp+dzmqoVSGqOt
         iDtduWPOOhMqRZ6X5vd3CEdo10NfJCUvGI9JQm/MdY9gjmE2kuH4LRETYHUrglfYxm8J
         VCjECmRAgTUl366uCinwIDOF69n2S5FaY6OJFhB2njA68JADokDFOWPoi928hFXfMxfB
         VH3bfVZX1XT/JVjKlUVWZJi68djN/YvQ0aFGC14/GD6WwBmQAobvm00Mwv4a1zw8aV6G
         TWWSXbzVPVAtUSPJfPtY03wapzuBJphxNZZ/50HL2mG/P3OXVXN4cflOO4fT/wy4Hbek
         8vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kyvvb8Dpo+7r/hNh0Hasg4c/obIxKq733Zz2TyhyGfk=;
        b=ueGJoJvbdj8L+jKMarWF+/mjbNWrILE5Sety2ZqmUamHDv8V4BIltKY5cNUMpvWUh3
         Q+lq5iRWkojdZiIi2z82HxDKleI9tMiVvZNj13gcHnFdS5ep4FQC++FImF07a9qsXKnR
         4Et0W5lTp6tbHf7XHunzOXQF04wzuNSJeVTSPDrIZ6c79RGP59qZFVL/krGVQ+2TK4vK
         qzKCmxt3NXh8wtnDj4nv8H5TMsRN/oHWxcrgT3PrXUVVal2UDZtE1pVhkrHRO5M9ttIX
         xjUiNG90p9N7xHr7mROUhep3apyA/wlycf2kQQmxP/gQyFNYVVk+VbOIkhzqo0Gz2nGX
         riHg==
X-Gm-Message-State: APjAAAVFk7sKode6m4PmvMWLZQ3Fbzv/yDiIEnlm9+yTPIyVCzxpFRN2
        /jmWQgS2KBoNPHOgsqpF7A0D0w==
X-Google-Smtp-Source: APXvYqxpBjz9vh9WdULbhd//bFEmA+VYRSMMw3Z/uoePAdJidj7tnNGvl62YsQy5ZWMZmZn6F/RnRw==
X-Received: by 2002:a62:648d:: with SMTP id y135mr35422233pfb.98.1559717985295;
        Tue, 04 Jun 2019 23:59:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e184sm28589093pfa.169.2019.06.04.23.59.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 23:59:44 -0700 (PDT)
Date:   Wed, 5 Jun 2019 00:00:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the
 SDM845
Message-ID: <20190605070029.GN22737@tuxbook-pro>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604104455.8877-7-lee.jones@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:

> When booting with Device Tree, the current default boot configuration
> table option, the request to boot via 'host mode' comes from the
> "dr_mode" property.

This has been the default on the MTP, but this is changing as this is
causing issues when connected downstream from a hub (the typical
development case for the primary USB port of a phone like device) and
more importantly we don't have support for the PMIC blocks that control
VBUS.

Once these issues are resolved the dr_mode would be "otg".

> A property of the same name can be used inside
> ACPI tables too.  However it is missing from the SDM845's ACPI tables
> so we have to supply this information using Platform Device Properites
> instead.
> 

Afaict this would install a fall-back property, so in the case that we
have specified dr_mode in DT (or ACPI) that would take precedence. So
the commit message should reflect that this redefines the default choice
to be "host", rather than "otg".

Which is in conflict with what's described for dr_mode in
Documentation/devicetree/bindings/usb/generic.txt


And this driver is used on a range of different Qualcomm platforms, so I
don't think this is SDM845 specific.

Regards,
Bjorn

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 349bf549ee44..f21fdd6cdd1a 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -468,6 +468,11 @@ static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
>  
> +static const struct property_entry dwc3_qcom_acpi_properties[] = {
> +	PROPERTY_ENTRY_STRING("dr_mode", "host"),
> +	{}
> +};
> +
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
> @@ -603,6 +608,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			goto platform_unalloc;
>  		}
>  
> +		ret = platform_device_add_properties(qcom->dwc3,
> +						     dwc3_qcom_acpi_properties);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to add properties\n");
> +			goto platform_unalloc;
> +		}
> +
>  		ret = platform_device_add(qcom->dwc3);
>  		if (ret) {
>  			dev_err(&pdev->dev, "failed to add device\n");
> -- 
> 2.17.1
> 
