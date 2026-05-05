Return-Path: <linux-gpio+bounces-36139-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CJ/Jb+8+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36139-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:47:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECC04CA14E
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C503300E14B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733052C21FF;
	Tue,  5 May 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9NWnAqn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DF2BDC26
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974456; cv=none; b=CfpQvc/P4xW53FNjry6D9IoWp5nIDWB1dAcJ9W2GipWLx8YUlRDjWvf7azXFzWA7ddm4aHmnNlS+s1Fz+8TyLBCnO/PXwif9Gs5MNjg4gvqD/9bfPLcgzZv8F1EGAUv6iOEjzny0xcUhlRrsTyBesmDvAPnbSDNmvzMq4yITY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974456; c=relaxed/simple;
	bh=/unGMp9opoNIJ6Kru/7vutp3Ovpo4/hi5PlbcV8Fe6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZl1f7hcPT2Sm04piG3KP1rJOAH9Mh/IeVtLEI67mwpWCJKSU2cdvrzVLAc+v0mt2f4CJJn0Wl93INX2tV3qG9DCeFS0b4JHab1PmA12YCPoaOMPoPWGlNgIC8atxcKUCqVf2FQ1WX7qu17YmtDr9dJGxZnYI2wZQSklysqWdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9NWnAqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAB8C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974455;
	bh=/unGMp9opoNIJ6Kru/7vutp3Ovpo4/hi5PlbcV8Fe6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m9NWnAqnSzn+aO3RwarQ8PDf4i7K1foTPR381UAmh0vuGGVaCauNLiJsE0CRI2eLs
	 8WZaOkV4xpuubkGXqbPlrC5AV5Fnq6YO4x0LA74RwZv8ibCcPWu7v2+FVdFph6tOqI
	 jteUFmHjNsXnFD62G4cgdTQMWaqAHhmTHFMnFPS8lplXQAuDpAjNaxYhg1ogMhCF8V
	 7DP7Ydne9oq5wZUYmq4BimgiYh/Ro1nCL4h7zggjcveTYZCbJ3bu29Q1CUdgqD0Xx3
	 T/YNQCxLy1/9JS52lmVExVpi+YrWDLt2kIfmb9exKKNbnAgUeyDCH2uTi9LFsT/ZpE
	 pBRPlaFo2NQ8g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a860667fabso3942547e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:47:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zzySy+81ZMqAUr9vSd4wf++15bTd203MYvfAXmzWYvQeJNxVzHCaAmKXnciSvL2FhNqILhuKThj3g@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTIP3RDALAbvKYLj5FJWoE+q3LtG4ZS4o/7g0igtX8Hpadi/G
	UF95rVMbzu4kPFBXM6uUl9xb+HQBBTyUlLUVqoi8JiYmnYto/LqnF1KtntCVW08mF/3wJCIkv/0
	tLNGNbSIBFrk9h1FfsvspJFPJXSAtc8w=
X-Received: by 2002:a05:6512:3f10:b0:5a4:1389:98c with SMTP id
 2adb3069b0e04-5a8631c1183mr4987451e87.30.1777974454637; Tue, 05 May 2026
 02:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-eliza_pinctrl-v2-1-feff875e8137@oss.qualcomm.com>
In-Reply-To: <20260429-eliza_pinctrl-v2-1-feff875e8137@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:47:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLk0f3DgTpEK5eCY+igLo70nx9=DhFnX4HagMzTBAPQdXw@mail.gmail.com>
X-Gm-Features: AVHnY4IhPLHdLCO1mdo6JcTLgs14S2OEwZrOt9oXPD0aLEbL_gegvh6bPOPk3T0
Message-ID: <CAD++jLk0f3DgTpEK5eCY+igLo70nx9=DhFnX4HagMzTBAPQdXw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Remove unused macro definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3ECC04CA14E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36139-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Wed, Apr 29, 2026 at 8:15=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
> platforms they are unused.
>
> No functional impact.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij

