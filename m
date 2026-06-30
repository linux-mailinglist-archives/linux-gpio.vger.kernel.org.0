Return-Path: <linux-gpio+bounces-39192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5SnxLqSrQ2rFegoAu9opvQ
	(envelope-from <linux-gpio+bounces-39192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:42:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0816E3BDD
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:42:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LYikKDQX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39192-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39192-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E3213011A58
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D172C404897;
	Tue, 30 Jun 2026 11:42:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDDE401A26
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:42:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819742; cv=none; b=N5wGBIeTtMPPQnKqrDNuiJaV/2WKgwURJ94iPMkZBcZvJpNVBY4Qv1Hvgfz2zzByyvYJ5vD6TTxKktMJtx7vASXV3hXxkfr4M99OTXfplW9kvltmR6bxJGIx0wW9GlWD0zUTugv9lRIiik6EBfSOuYE8bA/FrmVxto0EVotw/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819742; c=relaxed/simple;
	bh=LTM2FGFdsfj3aMK76LNUhcLlBo4dj8gtzXyYmNYMEr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GV8b2GhX8VtwEB1iGEwpsQl+MfNR5xKNziEw+Wv4mgQtKIS7kqYATCrVlIVkp4uxesM0QBwGQdSDyWpsu+12w3VImQxC51Zj/4LOb35ga35u9BEmmkM6ijYMZosIaCQ59URfrWe4VvCc4j3pjGabUfdCt7EbyVuXws2CYFKV7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYikKDQX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D27E1F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819741;
	bh=nxTCFNBV+5WgjeM90QEBSEZQuSb0NkbNyeqlQv5w/qE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LYikKDQXBLo0kCPnvLGoe73f3Ixeu+qKUg0BFdjZUIV+ou6MjJyQTaODaE8Yfauhy
	 R4ht/SukhvoD5+nxiHVBoi+PcAyNAutoSBMkJTexPpe59Wv/GneKvelaa3FAkduAnv
	 1vBtBDPj2/CXfER1XSgvaecIpBCGjPuLrxUahB8FjGq7Vux8Ff74JlXbi4tKaltNWh
	 fLTa1sAiDiK/ViVDgxc3kjLp71ugxsdeSSoaEiSLvGutahCzQqEXa77/riKfOmiXYm
	 JRlmnhDOsK/4pg2WW3i27iydAWwKE7auP9Q3FsxaiPW7HmbeB155NYStkTJP8WNXi8
	 NLJkvDWl2pVfA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1337821e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 04:42:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5R0x3eFA12eo31FiVJOyGhK2OnSDN6jW+8BqZmb6VapqJ4+AafTRoVxSkw15tPq6hpgt7Ki7F2isJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0t+sDvWFuSzT/YAERw2aVA3vSr7J2LGpm2rplbDzLX7S+fIke
	ceRakLByC6GRBdyqecTNLOQMwqZd2/xY5Df7CCPVybco69dUD1xFb7lrxjw7JSRFEtpiBmNjQ5R
	01j1LGbKm7lD+jCao/0qsynZouYQnzH8=
X-Received: by 2002:a05:6512:154f:10b0:5ae:b59e:aa45 with SMTP id
 2adb3069b0e04-5aec10a7063mr96918e87.17.1782819740197; Tue, 30 Jun 2026
 04:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:42:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
X-Gm-Features: AVVi8Cd7eCD649SnBV2WxKux4nyUueaUnvWYYumbluks4lrE1IUtvzMk-4VKDAU
Message-ID: <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39192-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E0816E3BDD

On Tue, Jun 16, 2026 at 10:26=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
>
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
>
> +------------------------------------------------------------------------=
+
> | SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  =
|
> |----------------------------------------------------------- ------------=
|
> | Version         |        v2.7      |       v3.0        |       v3.2    =
|
> |------------------------------------------------------------------------=
|
> | Pass through    |        Yes       |       Yes         |       Yes     =
|
> |------------------------------------------------------------------------=
|
> | Secondary       |        No        |       Yes         |       Yes     =
|
> +------------------------------------------------------------------------=
+

I don't know what to do with this hurdle of pin control and irqchip patches=
,
luckily it will be Bartosz' problem since he's managing Qualcomm pin
controllers now :D

I'll be fine with brining the irqchip patches through pin control if an
irqchip maintainer ACKs them.

Yours,
Linus Walleij

