Return-Path: <linux-gpio+bounces-34268-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGqEKoJtxmmkJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34268-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:44:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7383B343ACD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B8ED3049A81
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2B33815E4;
	Fri, 27 Mar 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCFZDlcy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0098337BE83
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611831; cv=none; b=pA0iGf+9d9w/3GlllT2SUJ+U3eUEmHJM0hew5wrw31u/k2jcnBiftPTGnFnfxz5CgxNq9MrCkAIydcBr6kp84ZdaLnyyrnXCExs7aa38EBrBA7ZSKGF1ke2OfkvLUrLnF4HcNtr6SJ1jUCCuoKOb80oA2R1Kv3v4TzqK2EbNUhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611831; c=relaxed/simple;
	bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzsUqirmwB6wlbXFeCMqheTmRfNANE9g1zyNpMqsRh7AxGJW5JPJ1R85EexAe4nuMPwQ0dlkHMbKe1CH5UsEzEB3BQavrkByfOpqEm7wQWXFS9kwf2HWK8MIyJxC8CKEdA0ZOdHTi5C34y8/fEeF8iZQjNZS8QPPT+muc2cIdn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCFZDlcy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso15564735e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611828; x=1775216628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
        b=VCFZDlcymyWedTuxXRYLvs43DT350r6kakAIya0z6X5bnX+75jGT8Yw4nD7Cm12gRQ
         kwkVmGTxBj8e7paOG72+bwqJI0e5ojbCmGeugkp8CViZzQWIPSm46YbK4PtV1o+4Ved+
         zN0V0Lx6M6yzTM/XGarWn82if5ioivbWOSctocnJt7UiGurR6zQ+f0GY3HAkAdKPOEau
         Bpnc4nDl0p7u87r6vweMFq/UtIzrjzfd9Qq62T7iwZY85qr51rpIQ7rPlPYswMt6BOEW
         iF56Stgvw/2eSd/WNIaTf6jhVc/+pSc3zbXcwTRimnNaeys9lAi1mlHMG4eR9K796UOw
         EXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611828; x=1775216628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
        b=PJ5nisXrR9kQwxMDqFL7o+MJQFRxTXAjHfyd2ql7hQz6IDpp4j+sC5H9pjMnF+zjfk
         fRQzSc9K9IqWaAiX6JvrLv21aiRY5sJMN3IMorw0Bmqqhwu5aicaTYd2v89GJZN4CtgM
         4fDMQ/jI1JQdrTr7diISCp0BoVLSV4AmvPBt0VGKyNhVaMb+xlu0uo2B9CTVH9wWL2KJ
         FwtkkNPEDwQ9gPtLu8Q5Ky4zeB89e97hshIf3ySrAzRvfkWxEbjl2eXXh5nZqMfuZkLw
         An+BQEXA6ixB9hNGUNbIIly8rlHvpwiZJv19NOXlpEv7EFOwP7/cQrlqdtKTrKDOk+7s
         OkXg==
X-Gm-Message-State: AOJu0Yz26trlDhJqVQ11OO1z4yqG7z5Yc3b3uEHqOK46aFNp0qsPfc/5
	29prGSD+g2y/HC496rrG8px6egx7Bt7pgQkrFrKOJRkwumIN29iTfgCE
X-Gm-Gg: ATEYQzwfqiZHAHuUMCPh2XTEPq4mECSTYe/L9M/GwzNSe3TE/a3q80PjF+XOqI31TnC
	kyCmNViYtM4XRYws1GuuGWD78HP/KLBS6plEYryb4Wz4aXexXUmTyyaJSZyHERNlPMM2qqFDHUx
	TfAzFhllJNOGiq9fuRVXsg2m2lv+61U57txutYi0xiim6braHi087rar6YceTNnt8V2Vax/ULgh
	4AFenQQL7yOV5IpObMdy1iTj/VHpNwdpYunB7cxEPkrBBVkLWX4bkyJ4wVnlUA5xAWupjdnDEvB
	DC9J2V31KZ3boftUZy2Edz3kd6ZsGgGg6v0Ho0PK9evZ2Cdnv0GJq4a9dfPKdmf1ne+0HIBYoWa
	8tuSNQUV1dXKLU4g6d58nHEmwUnwztoMgIFLurCld/ic42B5RDnehPXJEyC+KREhhi2sUGq3E0a
	WRxPYD2Wnh+hF9i87Y+0SHnx6ZKI4LNalkCCHHyuj9od0rUMe622zDWVv84cLzLhgy0u4Q4+Ise
	VGSzd/MakbCaddh3w==
X-Received: by 2002:a05:600c:810b:b0:487:219e:41c with SMTP id 5b1f17b1804b1-48727f36da5mr33865035e9.28.1774611828249;
        Fri, 27 Mar 2026 04:43:48 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm184799345e9.2.2026.03.27.04.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ banks
 number
Date: Fri, 27 Mar 2026 12:41:04 +0100
Message-ID: <5976712.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260327113006.3135663-3-andre.przywara@arm.com>
References:
 <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34268-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 7383B343ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dne petek, 27. marec 2026 ob 12:30:05 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 1=
1,
> to be able to assign the correct interrupt number for each bank.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



