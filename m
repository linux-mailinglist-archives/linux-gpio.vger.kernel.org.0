Return-Path: <linux-gpio+bounces-39927-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8CN4DQuWU2o0cAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39927-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 15:26:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D12744C9D
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 15:26:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=ldYDzpyB;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39927-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39927-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E802B3029278
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE053ACA7E;
	Sun, 12 Jul 2026 13:26:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203E31A6807
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 13:26:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862780; cv=pass; b=HobAVfnepfCFiEsgMGYnDVfw6kAVBt7ZRFpN7RfG3XZEqBwnK0Y3IQHbJDqfzsZarNRWAIp78zLUg1pBdg2RC5YPMGgm8Y1JIfUonRXwCvtxMq6UeEQfRzVcwd8y1mknPgu7iFAWyNj3fnUN3uVo8+f7FSOKp9u0XnAJguKKZs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862780; c=relaxed/simple;
	bh=UGBqnk9ZujtuXQRWO/BbSzUobhHpE2AFBXipHVxZCWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b982AnTZTgN/JOEBmyEboXkhP1Gymat9jsoToKkHort+JStGMSR1YZpNK99B+KSAJ1VE0bKQnukvGnBIJpmchLOg7xTyniti892QzreErOUSlCCBvfeyXFoZCQ9PeyYDXcdHiow7QnD5bKBSjmFOCu2XNkhQfrFb2z6KeglGZig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ldYDzpyB; arc=pass smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso21045345ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 06:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862777; cv=none;
        d=google.com; s=arc-20260327;
        b=BO9y3dfEig8gn7WcMgTCt8rkces6mf4IC/PrUFMhGjB6YFIKKln3bnwm1W4zlCrZwj
         7yygiwDQNU+q7fKy5sIHXAP5tRKtYXX9mtzdcAvoRGgeyS22sC+1kwlv1CiJDDhHmu4K
         LjlUGpESlQsmkd+ZdAIdED2gLOg54FNH5H/bqWwgTLqVFsKrlYTe4HTR+IdT824RDc9J
         kMnwsSHl6WdDravIc+TTOdGUxnOnGGDK7OCTUcyhBGx8/f/wXSk0cPRMkyupQtxNKlH0
         3NZ/HSWiXlpeXo6SWTTKGRh3AwQCrPwz0kjhzqvkKsMAE470TGxrahkY6MzW2I+Yt6cZ
         sxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        fh=IMRL9KvTYwrCe8As7Y6MHW2BTHbQsSLIQ+cgnSHouEQ=;
        b=O/DgHIAKABML4rQ6rJ8z69+nBQo0iv12SiEZPxn2+3WbYhud6RThIX46v6r3AEuj65
         5ZQfuXkTeipHGGuTiLBgJzNE7SX06EfVzrOWlbcDBaR5JEUdzRwDfqyoEtGgBct3v/KR
         DXPyq02bPwr1dceBFTWTLoIHhCMldFa0ifec1Yr3+87uR2WQarIa3IQfYXwFSH/1dTSb
         e/Gt8Bhwg/vtRLsdMeLGDfZl9JMMxGeMbf/LQVpZIFIEc9NcdCdt6RW/3Bb/FX7lL7nV
         jtQZncbHj2FOvyXnPXX9bn8STvo6chMvbT5605aLOMjjGkSIZAFKk7HrpLCsA71DGN5z
         +3jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783862777; x=1784467577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        b=ldYDzpyBagaYSrXVfDwRS9Bws7LXfvBmSf4bKdluuV+jef9fUY+VxYB/41AbqZWeCo
         N3/OO4CCrq/sTEyHeiI+nP2x19Yjat7z0kIRWNSHe350pBRpP7gdS6sXzySowM1OfzTo
         OIPTOTxV4SJ95adQnUIUZ40PT7HixJ5u2Mf/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862777; x=1784467577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        b=EkfPPeSLM3VMl4FA6sM0BOE+gzQrPxwh6tGQwMtvK0CnG1b6qVaDO6VF+cT2fjM4cb
         1BhS3zLQlayx7l842b9PZRNaKQ4jal5oTbS15N5t2XsfhjtWQhog0Pa3+I9hSIWJzGCN
         KUU8qsJkLlDds+K5dNPrKz1sFykuNsLL8a2hJNAMclOizDhIWI8JXR2JLycKkKHwa6OW
         Bus3/Q8pHUKFwTrRjSFKygFTSd8eo5ezJ7jbGs0kla4sqIFPnRz6JVt9TYQ/ii9aPPD/
         WU2Apg0JjnVkltKMySR3htaYqENO3Lu3AlR4CHqBSngcwmMoUhc0SQMuPpUDAyAebu4h
         E7FQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFFFiqB1LfRfE/JUU32FPO3u2tx7f5TGJMIMC6GwyR1GggrVHAzVBWQONucNMFIBW7qjNk8MOkU5dv@vger.kernel.org
X-Gm-Message-State: AOJu0YyrWClXkAg176JV2SCH7qSRQvOHVb0bAEfd8h6vaKV9qxyLLUY0
	dNDxV/TUFzIVBx4gU6/ROZhq2IqWvFHUfI4+yZ/fEGnVRcTQnny3Kxd+JssjUlnmPmafuqNyDdW
	AlIGYW+tKPrLUWivXmw+7cUYm0b6G+pWwR4AMtj+MKw==
X-Gm-Gg: AfdE7clFao8czewAJW56SrbkREpfa8XFbYlt8w6AR/YdbOTXmj0GAvau0Wk3SoUwxrO
	C7ISkSneV7FOv9fjV57Q1bSeFsruYvx/fipTlPZdlObTb4LelwAwqjqGUIJWHqUpiTvmgvd+jx1
	HOF4G1MrNHkbMyvJO81ATUvnTzwPBEuGy2aOGQlQLyq6dk2NyVoA6DbjPcKqaGn4PNwwnuRmnDC
	uMMuGgQrUNQ7rx/1OOhaoi4tvYmfUE5rS5X1eCfZXfPHs280lULzlbs0S/4J19vYPxoVVGCvGhN
	gYQXNhs3BglypdNQ0l5gPFUKdnYuPdWUFH6VokPBoyYMtw7Dky1dcvkxWCrrPIVADxFQ9lgy1Qr
	RJrLRjgVbCTGIiSo6cTz5JkfO0ifeN+sB6Eye64pTAd1M1i30A07nZnlVZrQEgLLgTd38cKr0my
	TLukoQk6Pr2rVROkGqDAu21Ld2RxMnKskBzzzuYujYzsIKlN1frZw83NikIBcL6Hvnq6vH0fc=
X-Received: by 2002:a17:902:f68e:b0:2c2:cf20:213 with SMTP id
 d9443c01a7336-2ce9ee1142emr64188895ad.29.1783862777565; Sun, 12 Jul 2026
 06:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 21:26:05 +0800
X-Gm-Features: AVVi8CcSrRWGUCKgP-qOLOT7aAQyJKXDMD-z2g8-SgHYdx-u7MOSLDSuRtVid9w
Message-ID: <CAMVG2supxy4H5L7xV52HzA6JLsAyTLa8PixmK7p9HOyZRPpyig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39927-lists,linux-gpio=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99D12744C9D

On Tue, 7 Jul 2026 at 17:21, Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
>
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
>
> +------------------------------------------------------------------------+
> | SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
> |----------------------------------------------------------- ------------|
> | Version         |        v2.7      |       v3.0        |       v3.2    |
> |------------------------------------------------------------------------|
> | Pass through    |        Yes       |       Yes         |       Yes     |
> |------------------------------------------------------------------------|
> | Secondary       |        No        |       Yes         |       Yes     |
> +------------------------------------------------------------------------+
>
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
> inversion when needed for falling edge to rising edge or level low to level
> high, as the GIC do not support falling edge/level low interrupts.
>
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
>
> All the SoCs defaulted to pass through mode with the exception of some x1e.
>
> x1e PDC may be set to secondary controller mode for builds on CRD boards
> whereas it may be set to pass through mode for IoT-EVK boards. The mode
> configuration is done in firmware and initially shipped windows firmware
> did not have SCM interface to read or modify the PDC configuration.
> Later only write access is opened up for non secure world.
>
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
>
> As the deepest idle state as the PDC can now wake up SoC from GPIOs and
> revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
> parent for now").
>
> The series has been tested on x1e80100 CRD with both old and new firmware
> and also on kaanapali. Test conducted with tlmm-test module after
> applying [3] as test module needed to be fixed first.

Great work Maulik!

This patch series has been verified on a Lenovo Slim 7x (BIOS NHCN62WW
12/02/2025) with X1E80100 successfully on 7.2-rc2.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks,
  Dan
-- 
Daniel J Blueman

