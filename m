Return-Path: <linux-gpio+bounces-38599-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZX5zHfedMWpWoQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38599-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 21:03:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EEB694B17
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 21:03:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=luQxn9cl;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38599-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38599-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A77E324B8A4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 18:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AAD47DD40;
	Tue, 16 Jun 2026 18:57:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945A47D92F
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 18:57:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636236; cv=none; b=ECmFubNV6JIqLtp03oZztJvtfLp5oXUKOArDGJb6hMy6xDu+PR4oT1+ZxNmj2LVTRq7XieSS+VR3lIiCkDhrsA1fJY4tMdKAwjploLDPhoggHSNle6z2BwXRbC6PQcP3YWJ9p8K8kTaPSS+2sDN/vx/Drlc+Zr3eFQcU6VqebhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636236; c=relaxed/simple;
	bh=6/bCaUbtfCncrtxzychO2vuRtHH/oCHj4qDutkWacWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkIKGVp3tRiS4sIz8U4ZcJ3ttdIaDn6d3USu6azPOzQoFCstdxbG74yyX6TLEQbZMxq/BSfElHAzbwNquj7nvWeJ/k3NBr5rU1kOkJDbBmbOcEJvbR5gZsUlQLh1IJ8tJQ3AhykA9oOnUpBQVT3En+Ng0LlBlDt4zYaSzP3xzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luQxn9cl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9B61F0155C
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781636234;
	bh=Kg5urtXwHhG5NTd2I1ePWdoMCidQs7lsiIoCNc/Lh1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=luQxn9claLnfUGUe4BPO/rKUJCKvbYkdDQ+j2wsHIRz6AQVNGuQHOD9FBHPCskdqe
	 Talz+wHwrzepupIp3d+SdJigCtw9Lh4qC8oi7IQpB9SCoXxl+LgU4f66IuqYKOZtf5
	 tieRGEMDoKYR2r5sJZGKvXFJ3dDoywYVOh4JEgDYatvyfewTCFwCT8sbizwxy+HVbk
	 rsBMS51Q/mz88WQrG5h+I90N7HeVmYm0ykIqXd5MmHWUHpLkCkLf8+fuCfQ0j6EYWU
	 WkKYh5OPblH6nMNoAMO8dNfO4Ja8DM3ZVM3VCiavzuHNaL4KlPW3pK3MdD6JQMeQT1
	 1u5RACOzy2rzg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so5248498a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 11:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9gaXxjkeTTMOfWDW531byKICBDmxEOYF9k550dyjZymCIubMpytFxiI58aJ49fmJmxG90dmWx7/Hr8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc13nxD2ZbPvlZm1XzJTopiWnUavRTl945AOYtPEsn5wjinzsy
	P9xL2SdF7ULzzdHUchei2MZro6hfjWdbIi1OQJ1I6LvKXFHWqaAWVs8F1mNm1F7TsN3HYzYUlGY
	8VxsZIU4sypxFyV6Mn+dMX7RSqnBlLA==
X-Received: by 2002:a17:907:aaa:b0:c04:1977:1025 with SMTP id
 a640c23a62f3a-c05a128a414mr47141766b.0.1781636233441; Tue, 16 Jun 2026
 11:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615071836.362883-1-l.scorcia@gmail.com> <20260615071836.362883-10-l.scorcia@gmail.com>
 <20260616133918.GA2335264-robh@kernel.org> <CAORyz2LiMHnaTK6QnsLxJDtw0fZ_N9LELw0iCorOZwHuWXus0g@mail.gmail.com>
In-Reply-To: <CAORyz2LiMHnaTK6QnsLxJDtw0fZ_N9LELw0iCorOZwHuWXus0g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Jun 2026 13:57:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLGqqyDoGskgmRLzQC=UkFEXgW=cDazc=frO2KBaSri=w@mail.gmail.com>
X-Gm-Features: AVVi8CcwnrM4llpoEzOBnyyyWauL3xCmDN5lvRxGwwKA_noSBsMx_Zki1jU8Teg
Message-ID: <CAL_JsqLGqqyDoGskgmRLzQC=UkFEXgW=cDazc=frO2KBaSri=w@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38599-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:val@packett.cool,m:dmitry.torokhov@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:louisalexis.eyraud@collabora.com,m:julien.massot@collabora.com,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14EEB694B17

On Tue, Jun 16, 2026 at 10:32=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> > >  arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++=
++
> >
> > Nothing is using this so it is a dead file that doesn't get tested.
>
> Hi, it's not referenced as the dtsi inclusion was removed in the
> original patch from 2019 for an easier merging of support for mt8516
> pumpkin boards [1][2].
> If you prefer in the next revision I can add another patch to readd it
> to the existing pumpkin board.

That or move this patch to the series for the board(s). If the board
is already upstream, then add the include in *this* patch.

Rob

