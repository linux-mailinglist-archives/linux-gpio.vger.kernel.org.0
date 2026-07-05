Return-Path: <linux-gpio+bounces-39485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JmPsAnLdSmpJIwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 00:40:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A37370BA96
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 00:40:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IZzyVtOT;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39485-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39485-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94A673006B25
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 22:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC6E347521;
	Sun,  5 Jul 2026 22:40:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F223171CD
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 22:40:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783291245; cv=none; b=Fkr/dcKXid93k77KYG7oUVgUT1mrU3Ymhc4tIFZIcLwdlZIgNsJEaq/RLjLsZaWhyJrNkyt9hsUzOOHG7KYhTWwCNuS7GyfJ8AwNf/CEc4BrLVEfCP0/TwB6TLfGe7Wv6DxUVgTThQB15Fw2HMV7oBWJJ8nGqe+p7AMyORQn144=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783291245; c=relaxed/simple;
	bh=o6tKcjSGL3hmAoOfrQ72FhjNH6OcQ99PKzW3pQ6hb58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzHlte4CccfTPczWh/pyJnY44JlR9Mc8gnDfvmVXKqsSuL/AbfaDpqTtWDfPFx1nZykLJMyeC6cUcWON3VEogMMrpW4hcOxsMdrTGA5T7HTZ/qrz2e5/kJV4kl0NdvOpi1IMj9vcozFjZkGBbt3aMGsl4EElqUs3/V0pdqRb7cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZzyVtOT; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so5836805e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783291243; x=1783896043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veU2IZXpTiLRV+FUCeAbLnHfRb1mcReExg9kWOUDBqA=;
        b=IZzyVtOTFcv7PRBDHD9/w92l8TEWp9nBHTccefnzhmj9va1ldhieCIOA4T5vb27jRC
         0VeUky/pI8uCWNc817jEiSCSARdtbltKuTVdAPevc9pJMqZE82DnCmGDG2zIWOkED+3M
         33CT7zxRAOsUYKwLUJ4XSVBOHIPK9QqUctQRp0UmLSudRhuwPDl9+Kknt1CBUUl2J446
         4LiIhHZt7mMZJs5ivy7SMxRpoiiBmNXNU6W2cnCx05ADuomxMSstPwPoSaj5qpPIflBq
         sZSbcILeHpQu8bzaNzM+SWcLClgqrj6AIN9yTh/cY84Mf5UXEqirx5JU2HFRlys7g1xz
         xBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291243; x=1783896043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veU2IZXpTiLRV+FUCeAbLnHfRb1mcReExg9kWOUDBqA=;
        b=QFGBMioxFKdazedIQ1uubm5KUtKGZEkNOt/3/OUw5aCNNhYXMxZx07VhLYhC3JDJaY
         Vo9pAO0tqgHJz+JWHxEUPha0Ix0WC4T22ihCIMiKLOB7E/HzwdBT9r42w3IGBgSC6An5
         ZHsJvKPcZIiLn/DEAKigaAi4QDZ0qX5gEukPv11pOmDQ2lqzr+bijBRkaT/oHM3u9R3v
         Ww4R7aTBO0aIRedGi4TOk0Mo6NHgbQ2TmKTBuYHXjEIrbkeYS5huvHYE+AXjb7pclY/t
         Rc2znllgol8RLujy4TuYFXCAE7I5u+rw7ulLTFbIAP2YmrYPBqZGhQISFd3lyx3lwTSu
         lHMA==
X-Forwarded-Encrypted: i=1; AHgh+RpbnOrzebRquJeV0Vaj30Gft45AcgfrumE8yJqXBUQduZ+gU3uUqGHqitWdDyjc+x/56VkMIzaRBTd+@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjUzGKAwRUPWg8TtpbzyGpAa814gfLBXfKR9ca2sNv3UuIEio
	fq+4gf7otH1Lije0h73kjNgjHTv+WPdiQayP97o8m1/gm/k7yiu5z6e7
X-Gm-Gg: AfdE7cmblZ+9kbhf49UtNfbyqwo0tQMtaA0IhJGp3l/mW0eh6b5NEi4KGNy0g8Cl/Co
	A/TUm5zQxVXa4IVqU0aoPLDRReNp7EToH0Cz2yoQG11go81ma0LrjyuLEPUkUAgp4qI6SqJjE/Y
	Eg488cNXlohccQJwiVpcliEoopkINULSpD4wVi7k31JCSeAReSdyKF2WrICI6/xvu5HBF/F4xBS
	ZND5G5eCrpeHIC5q6dZnUntERqs1e8sboOLp0xaFR8uOeS6Eoiu7uW9AeFU/87N1tx22XeY9C8p
	LMPjTtnliCdM5xuymfIxiXcXMY+79dsExhFGtB2Yi+iiz+kI/hcwpS9BW4mOlRyYAiLPXzIhRYF
	5vfPIW0b2FqU9wBKAuPs2Lfmz86KESWkbY1Kk6bqnm4e17IvqsdTKScT/pO+6pkrXU2ZjMxJ6MP
	YDZswJcpanwf/qWOKF5fZbJFEgXpJF8BFj3SX4XT/D+SHUe1/+U71wR7mik1E=
X-Received: by 2002:a05:600c:314f:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493d11cef20mr85595145e9.6.1783291242828;
        Sun, 05 Jul 2026 15:40:42 -0700 (PDT)
Received: from [192.168.1.109] (87-126-128-216.ip.btc-net.bg. [87.126.128.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef1807asm289906045e9.1.2026.07.05.15.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 15:40:41 -0700 (PDT)
Message-ID: <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
Date: Mon, 6 Jul 2026 01:40:40 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
 peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20260627171228.2687857-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39485-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ivoivanovivanov1@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivoivanovivanov1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A37370BA96

On 6/27/26 20:12, Alim Akhtar wrote:
> Add Samsung Exynos8855 smdk board to documentation
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..273464400477 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -235,6 +235,12 @@ properties:
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>  
> +      - description: Exynos8855 based boards
> +        items:
> +          - enum:
> +              - samsung,exynos8855-smdk         # Samsung SMDK
> +          - const: samsung,exynos8855

Is there any particular reason for using "exynos8855" rather than the commercial
name - exynos1580? We've already established using the latter naming scheme as a
convention (e.g. exynos3830 -> exynos850, exynos9830 -> exynos990) rather than
the development model numbers, so I don't think breaking that will help anyone
with the already painful model number confusion.

Best regards,
Ivaylo

> +
>        - description: Exynos8895 based boards
>          items:
>            - enum:


