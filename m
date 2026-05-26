Return-Path: <linux-gpio+bounces-37537-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGDQLs6TFWpSWgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37537-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:36:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C65D5A43
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2B7C3042C63
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5BE3F9F56;
	Tue, 26 May 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbARjkY+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D5352C34
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798921; cv=none; b=bcWMHcc2WQKqy/7U2knXclscsHGefURK1npM5pTQw8Qc1Bc1iRkU/w6nSamhs0huXqQoKPCTRUPnYvZDTEUNTmfTeajJAYMc0OIkrGC5Brjv+BwvzG9qJOIc+zvCN4bzIOGKrZ3PjDMyEmi6aX/YMVjAWS2XkN3QpdLryZvNRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798921; c=relaxed/simple;
	bh=uPfbrIiekRdi5c+dg2yX1VDpWIrwfNRjnUuAs2MeJ/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2m6YM3Ps8K18VpQfb1sPGCdDIlgI+EvT/sZ6shqZvoEwNXS/Rh2uitkmHK/cAknuEgHzBvqKoyXdaOXo8KYIxI/mctN2yqVdLoQ6nLuUizJ47L1zvNFFFIUnU+OiWCGr4UZpa98HQnFV3jB7mzvUChZ58gNpvSn4nxovCIufPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbARjkY+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44e1860558fso6735336f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798919; x=1780403719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+FnVwdbtAOn6T98aiA6Qvgl3nhPcMwGorw0+JjGTmQs=;
        b=vbARjkY+VkxTDWDTZz9suVzzwNiP1Z4bwHHksjhXpz0hry5MDWniviPT/x3MJeVYD+
         9doeTZosUr95wAp070Cr7lqFoe7WRcbAFjtz/B+wKXtPyVcOw/oQXJ5JimrP5DuAn05W
         0Nom8u4esgTR7AYjYRExXMV0VpEDTiUZM+oCxbskqUpI5svEDXQbyQtcLZStSdLWIKK4
         BhFRwPsDNnjZ5tQcYZ+WeUIlC47B97XBY9Sn2r6aAnZ/3X7m3wlLV3NsXhswrdOz8+kq
         vUUIovd80OnOesopANQhwjP/G2LNN7K/BnQsSYaCveDC4NTPW+s24HUnq+lyQAdwIvHT
         TDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798919; x=1780403719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FnVwdbtAOn6T98aiA6Qvgl3nhPcMwGorw0+JjGTmQs=;
        b=V1bBzZPZeYOUiAllStmqB0bQmz1huccd77I1idm3xqoihiJN60wBPOxsCO9JIfIco8
         xclYRKvv/hvoviEB1YFtmEbvcg3WYcet5d4pzr7aWXR2S2i4b7foTlOvBd8s3xtY/LJ6
         yDjVB4GO0hT39Hmq+UYbnk/FJYANFOuPZi0+2WknkvyleXqSkYqQVd573QI3UvIoQ8yB
         cm724Pd8O5/FziGiV5Ktl/4duUEoLK71Aecwzqd6GkD4P4wStypVEbjKKYAZeS114Oqa
         k0TeM+oG0J1O+8r1hXhS1AItTpkdiiE1swx8wGo4mbJdNSyDuP7W4Z/LYH4fkTpB8X5U
         wO8w==
X-Forwarded-Encrypted: i=1; AFNElJ8VJp/Ip/FUGl617sqSD3VPyDa26gdypW7DPakRsKewXj4KdHkv6ENmsBiM0IOyqyA4MYVZJuWVv9Xs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YmTB4JIR9+JFDQBJFBNlvRH5RAgIoi16kjXkYMnA/Rig91Qm
	93E5awuW2qGMAWIBzKI+qdiktZLvD7fGdtLflyw7irZQSm0JaFj3VPaTgGNawcFAVoc=
X-Gm-Gg: Acq92OHgdaVQ0xImcg9mpYq3RmKzFUZFx0kWeHCt1pbjwHNwHk0NVxCf7tPngkKAM9S
	u464XYGQ9BD0r16l4vRl8iRrBA6vI/CbdKpTo7gB4Lnm8i4FEvMkLqrrOuauP1IqyRvbXJZj2Jf
	FkrYMWCyEzSL/txnSfdM2ZYtkIzK+fjn6hlh5iCGa7CceHZw6kvdS8tNyT1lP0qhWlHrA14wXCd
	FUuspYzlWWKMWSd7lHfK1oPiBAQQq9TvtOYFj6+k/nRK706HcElG6mw0Wq3TMhSFy85xUsqHOSK
	1zcP3fSi2E/vkHOUcAkpOT+rPYB9POsyF8SC525njeMT61DIwzMlKrVonID8ANY5iBI5dGVhJqx
	kmAVEFidnilv+29QnDlbCHr/YSH3if19mMh+wp7noa5KSZwRFxVUzymAcF0XFpK8gr2+0b48PFz
	pzkNm6XP/AmWLNaCMDGFgbZBhyl2q1
X-Received: by 2002:a05:6000:25e3:b0:45e:739c:f187 with SMTP id ffacd0b85a97d-45eb38c5329mr29111131f8f.22.1779798918558;
        Tue, 26 May 2026 05:35:18 -0700 (PDT)
Received: from linaro.org ([77.64.147.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6bc5479sm37517812f8f.0.2026.05.26.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:35:18 -0700 (PDT)
Date: Tue, 26 May 2026 14:34:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
Message-ID: <ahWTZj727RCNZPR9@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37537-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 745C65D5A43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 04:24:39PM +0530, Maulik Shah wrote:
> pdc->enable_intr() function already points to respective version
> specific enable function. pdc_enable_intr() now only kept as wrapper.
> Remove the wrapper and invoke pdc->enable_intr() from caller.
> 
> Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
> however its only required for pdc_enable_intr_bank() which uses
> a shared bank across all interrupts. pdc_enable_intr_cfg() do not
> required locking as IRQ_CFG registers are one per interrupt. Move
> locking accordingly.

Well, pdc_enable_intr_cfg() is still a read-modify-write. If two CPUs
read IRQ_i_CFG at the same time and modify different bits (e.g. enable
and type bits) then write back the modified register one of the
modifications will get lost. Can we be sure that this won't happen?

Perhaps we can since PDC has IRQCHIP_SET_TYPE_MASKED, but personally
I would keep the lock there to be sure, especially with the new GPIO
operations you add that also read-modify-write the same register..

Thanks,
Stephan

