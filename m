Return-Path: <linux-gpio+bounces-34764-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEW0LRTV1GnuxwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34764-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 11:57:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8E3AC633
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 11:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434E0300F109
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 09:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549693A6F12;
	Tue,  7 Apr 2026 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gn5sO0c/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187713988EE
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555855; cv=none; b=WBXtjLxHGARrh2hGrSMGHErsbP27foiGiyEMvFDFjStrVIPNaz77oIinoH1RFEISo54NcbYJAlmfgZIU2A4aYB4H0DiuU5wKnDyHYFJJ17svSPD0SzkBNbxOZlr36KAlQAbDyQ6EEm83Va+ePI3YvuEFLjYaxC0qp1Fg5mt5PsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555855; c=relaxed/simple;
	bh=TuVMT5bN+m95WYtvj/73i4XXJqjaKjjuZWNA3kDqedI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+dK24H9n3RqTCi8W+6nWQzSilPe9l+PF/vY+1jt0fk/gHvtxSloRSHYOdF2LWwYGG9/5wYIjJ+p5S5rPVbwT8io/v72i9Uj98JN+yVqJjGL10VOo2ZZB62UKGCJu0s6/LdbwtZiJTOHytARH0249ZDuX9lJ0rkHF+h4e5d8yAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gn5sO0c/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06C1C19421
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775555854;
	bh=TuVMT5bN+m95WYtvj/73i4XXJqjaKjjuZWNA3kDqedI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gn5sO0c/7eVgbGMIgqRdznf6zusx2Lep33Of8+3OYN366VqMIn+9d2+2i+27hJlOp
	 ZdnVZms5jbTZ+xxVoIs9TwQJn9vmT9w+/UfI8GuBrNou7ly1lzm1LkTCisxzbeTfo8
	 p2TaEh9mZsS/gv7hiqOF5ZNwVKalmLSPCuwWWBfgnscQzBcyNSf5E0oeHiOQsyhctC
	 FdeWiPjiKhEaHeFta8sK6kYcje215M/3Q1LbPatk0KdtW6DLhmLA5U/3NGSfJG6W1h
	 Db768T2vpuKf/OPSFemnJ9miOGUXe2RCTldqlzL3eIVPEssHWifhLqZPCrB4JsSzDb
	 nrslKrCAyXAPQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-797ab169454so79364087b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 02:57:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsox3H7ozKbjzKp7HHIGagZtHYcbVRKuKGIr55qDAKpqYjr0xaleZlnHTdsp3hnHH8cB17WKPi+0eS@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSY6qRoXKnLfK7dVhe1MkBKGir55yiPS3ZUGn2Yk6jUnj7bIT
	h5RmYnmgYh4AV5FR7vwZvhAR/UbTR9lWZvRgx8j4CUG1MKo+RqBpJ4r8Yn+To8HbAM2scLdQxsk
	gGYzuKj1D4MWlOS0SZvSN60lha1LYoTM=
X-Received: by 2002:a05:690c:d91:b0:7a3:e167:14f3 with SMTP id
 00721157ae682-7a4d3dc6489mr168746407b3.17.1775555854291; Tue, 07 Apr 2026
 02:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
 <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com> <5c0a53c5-3750-4b80-b3b0-0bc7595454d9@oss.qualcomm.com>
In-Reply-To: <5c0a53c5-3750-4b80-b3b0-0bc7595454d9@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:57:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmqs-PrcrR2D3WW+U=9YhB6fd2ueEgcWwZR5J9nfDouA@mail.gmail.com>
X-Gm-Features: AQROBzAVrBEKTVSp-mS2ZtAtqEMzFRD576TgGbYe1Kqh4cIC7aT5grjOqoC3Nc8
Message-ID: <CAD++jLnmqs-PrcrR2D3WW+U=9YhB6fd2ueEgcWwZR5J9nfDouA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34764-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62A8E3AC633
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 11:05=E2=80=AFAM Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
> On 3/30/2026 2:11 PM, Linus Walleij wrote:
> > On Mon, Mar 30, 2026 at 6:51=E2=80=AFAM Kathiravan Thirumoorthy
> > <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
> >
> >> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
> >> Add the pinctrl support for the same.
> >>
> >> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qu=
alcomm.com>
> > Patches applied!
>
> Linus, I don't see these patches in linux-next or in linux-pinctrl tree.
> Do I miss something here?

I guess easter happened before I pushed by tree :(

Sorry my fault. Pushing the tree before leaving my keyboard
today.

Yours,
Linus Walleij

