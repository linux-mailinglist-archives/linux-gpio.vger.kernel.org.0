Return-Path: <linux-gpio+bounces-31065-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB4nOf1Dd2mMdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31065-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:37:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF308719D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA73830054EF
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5751F331209;
	Mon, 26 Jan 2026 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXK02Q4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA7330B07
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 10:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423867; cv=none; b=b83aJjlH/O5LWs4v74u38TxrmuXVeUg/GWNdJrQVYTf2vOhBpQK4CP9LTs/kyuMj3u0gUetrvj18EL7Sc+EUOjt3ZcpVokkEAEwURII97gBze6xrzlgIkvNuD7cVVuuOkSjX6gTTiratrGFImaJJBLkMQPJ2w3Acgbqw7/3N0wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423867; c=relaxed/simple;
	bh=BJhb38isP/d1CZw93ApA2/iPTUfPcFPvoFHIZqdYKWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjgLHB6N74xSGkea71J2LjzxVotW8y7Ya9EVSdRuSBJwR0na8dUwPAZhJjWqSNFTphtJ33yYVkhUq3A/jFUKRkQQasqOfo8ZrFHicS7lcYa56lzFHlBRdlKPoaXpanuTrvN5KvBX50KWETqL7Og2oxy2+cFxBW3noGGiVh7sGic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXK02Q4B; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso43388775e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769423862; x=1770028662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xkux+EitG9JzPydAe2E8YwQFUS9lBx4JpjL6QxsZSNw=;
        b=XXK02Q4BWaDEWlh7gRJ2nuZM4fsZ6uiT8AyZpv57Bo3gxExOza1aO5ta8GPokNf377
         7vozkCfhIKIt4ysJPf+MJzYJjw9xhnrvXKQ5eVGP0xs4DvJB4T1TanBJufLr1FwxJabZ
         wuGh6+2Q8hhwnbinR2diR3sCOsTx0+tDwfZ5iJDxSpXGw2RF6Wf1BRNpaf7z5uXkeiP9
         AhrMnrIt6AsvNDHMyP7ZLv4X4reXexiX9/CSf4jobo665M6y4OzNchqDsSM0YGVxGdpd
         7SkvB8DojII7MveE8/IMSZ6WQFcdwY8Rf6XeTj0RlEZD/1B2yMPIgw2AH7Sg5CAhd1wF
         vt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423862; x=1770028662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkux+EitG9JzPydAe2E8YwQFUS9lBx4JpjL6QxsZSNw=;
        b=U7vqgUM8aavfrL36vm3hN4aiwjJGGbdiF55N4frEaOSUvjuj+XL3CM4b2ttCUs0yH8
         bOd9ILMNXQY+ewUoCaY3qpluUW937X4en1Nj/NxfgA7ZYFXcgieD02ewgZigbGb6Uivu
         snOs2OCQfgOxjW6pRGeonoTLNmq1eecex8tQuv1mqCtpZW7fDxsP5KyMhPOIpowRMdJW
         quGEJeBeea93DlnLmZS8jT9YFVhPy6zpChV7dsQ6xHGrvNU/9wZCk/pb57NR0Th4C2Jk
         l63If2K8V2lFxm3wrmAlGi6d5ASyQugPRt4HWLR7C9G6eig2zK9VDnbzs4+Bf3HEufwC
         51pg==
X-Forwarded-Encrypted: i=1; AJvYcCVskLprZjhCVzR4HVJXOLJjlqG3pF/vRF70kVLpdPoGP/XN5Ne7id21CepQc1k5G9u9Pvg9YZXTsD4N@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcz5l4QYxNiSk5UbG0h1S5gvkjNXVD9W7Jno0CdBMHoNI2lxN
	4oMjkhe6ZfbTHXWjGidBgPWK9+4eQ1PyZmcc/0CxqR6tKAWgMZCVF+Z7
X-Gm-Gg: AZuq6aL9QFIkHyR+7NG3IrBOKWRPbTbXIJZP8VrFvz7Y6F4rL63Xmau+lZI1ZUBqb+t
	4EhUUeI4GjF4MEbycPtqh1BKCqofsV1PzVwcuPM+05LTrYGOc0/uKEyu8Eeu3389aXwJDJ4g5xJ
	0/pKl6r6C/0cuApqJTYCohy+NISqPl+VayadIhgOjEI7ZQmmvcMmD11I+EPsh9Kg2WRKGrK4uUZ
	z1Qt8iXrRZd2Z/5NCa1AINaP6HwC0t/hLHLCFIj2VARgcr8vIkKCxikYW095PH1XFum79xrDI4n
	uVd+9DB/eBj5Z1hUiPdLyZZRx+9uiDmuiv/udlFFhx70McN9IWjF6QlNV/LOA+vKxkBDSZ9mv6f
	qc3IKHgrn18MsM5UzINBZ3Dt8WmAy/3vJkVuVuk4gFwFEvTw5lG1e9je94kPMFwV3H15LmJSvdI
	byhU39pS2DZO3uymTKKtFwy6/o76fq/qvyzAFwzFLK8mMBvGCU7UKanawIx7+CpwZPf28wHENZl
	DoyVLc5URl/KGDwU3bXUX74vXTFB8qTDKV7gGAoTrq2a3JLVWQnMGPFryC+
X-Received: by 2002:a05:600c:35c4:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-4805cf673f5mr69370895e9.30.1769423862239;
        Mon, 26 Jan 2026 02:37:42 -0800 (PST)
Received: from ?IPV6:2a02:8440:260e:5ad0:867f:b0c6:e80c:5b42? (2a02-8440-260e-5ad0-867f-b0c6-e80c-5b42.rev.sfr.net. [2a02:8440:260e:5ad0:867f:b0c6:e80c:5b42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6160d2sm104298055e9.2.2026.01.26.02.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:37:41 -0800 (PST)
Message-ID: <ed300810-14c9-40de-b50b-f60cd4241bb7@gmail.com>
Date: Mon, 26 Jan 2026 11:37:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] pinctrl: stm32: add firewall checks before
 probing the HDP driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, jens.wiklander@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31065-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,arm.com,linaro.org,kernel.org,linux.dev,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[legofficclement@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8CF308719D
X-Rspamd-Action: no action

Hi Gatien,

Thank you for the patch

On 1/23/26 11:39 AM, Gatien Chevallier wrote:
> Because the HDP peripheral both depends on debug and firewall
> configuration, when CONFIG_STM32_FIREWALL is present, use the
> stm32 firewall framework to be able to check these configuration against
> the relevant controllers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> index 0b1dff01e04c..cce477e86ef9 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> @@ -4,6 +4,7 @@
>    * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
>    */
>   #include <linux/bits.h>
> +#include <linux/bus/stm32_firewall_device.h>
>   #include <linux/clk.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/gpio/generic.h>
> @@ -46,9 +47,11 @@ struct stm32_hdp {
>   	void __iomem *base;
>   	struct clk *clk;
>   	struct pinctrl_dev *pctl_dev;
> +	struct stm32_firewall *firewall;
>   	struct gpio_generic_chip gpio_chip;
>   	u32 mux_conf;
>   	u32 gposet_conf;
> +	int nb_firewall_entries;
>   	const char * const *func_name;
>   };
>   
> @@ -615,6 +618,13 @@ static int stm32_hdp_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	hdp->dev = dev;
>   
> +	if (IS_ENABLED(CONFIG_STM32_FIREWALL)) {
> +		err = stm32_firewall_get_grant_all_access(dev, &hdp->firewall,
> +							  &hdp->nb_firewall_entries);
> +		if (err)
> +			return err;
> +	}
> +
>   	platform_set_drvdata(pdev, hdp);
>   
>   	hdp->base = devm_platform_ioremap_resource(pdev, 0);
> @@ -670,8 +680,12 @@ static int stm32_hdp_probe(struct platform_device *pdev)
>   static void stm32_hdp_remove(struct platform_device *pdev)
>   {
>   	struct stm32_hdp *hdp = platform_get_drvdata(pdev);
> +	int i;
>   
>   	writel_relaxed(HDP_CTRL_DISABLE, hdp->base + HDP_CTRL);
> +
> +	for (i = 0; i < hdp->nb_firewall_entries; i++)
> +		stm32_firewall_release_access(&hdp->firewall[i]);
>   }
>   
>   static int stm32_hdp_suspend(struct device *dev)
> 

Reviewed-by: Clément Le Goffic <legoffic.clement@gmail.com>

