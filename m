Return-Path: <linux-gpio+bounces-35737-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNXINKo28WmfegEAu9opvQ
	(envelope-from <linux-gpio+bounces-35737-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 00:37:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A948CA7D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 00:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CA593061DFA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 22:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F04A36F417;
	Tue, 28 Apr 2026 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1l3DgEo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148A2ECD3A
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777415845; cv=none; b=pr4kn4adh/0bXIes9EydbU1y5gJU8YNYYtKJsKrtmfXTh2yFhfzznLmpdphQbikQnoMTgb6QNKYgXy28g9LtG+q3n0+Zw4nMElsZSfTmWiIZksgQvD8oLc+JTzk1uQwpHTKAuPCwP69+LgwE6z5F5Mc7g2Pabtiuk+xmwYauWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777415845; c=relaxed/simple;
	bh=Y5K9w/dAWAPxr/f/0fJNiVHGZlLP5vvzBFKMA1ar/TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCS26Xy7FXcb1ztg8y5IVgIfdZhgrO+UjEJEm0fVJxEEVLM9MJ5rFvBRQDKZJu+y7bPL3cKU7X17QnBpj9gKxKiFtDqXGqfG7mgFh2HTdvDTv2zoZfwPD1Ld0AQNf1b4gPR5IzjRGOEt7lloc7PTlXgp7jMhH6SJpLcj54+V+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1l3DgEo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28D8C2BCC4
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777415845;
	bh=Y5K9w/dAWAPxr/f/0fJNiVHGZlLP5vvzBFKMA1ar/TM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s1l3DgEoxoarO4RJbnAUpEhbvabOkbcnaK8Uw2MxaiEc7mOSoOg9T7/A8hNGwoJTV
	 8x5pcnwCH+gDOjGnLY0ENAf19WOK/7TxocuNvZu4O3u6TyPIYiQvkGcR6Y3PmyLRbg
	 yRMRM2YqVncL0UmMWd/ck7D9eSVRwi3ADNXD/4NZf85L1fD8SD/0nzcSL7jjiqOdcW
	 MajQc82Z1tUD6v8SJGJdE7L3s29Np3tar4/GDF41fGSfd/4UILynnpU8vjfDQbZfya
	 jnNwrfPZK0yYAQChj4ksadz1sGl97g8GejXeAECIJsKPzsTxeizhwnkaNiFzi3KDEK
	 QfcdO/BodiRkg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a525aedb24so11822433e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 15:37:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99mqpdJVzBNIdL9hiIxR7laFgUM/yRBKf9sjFd3PG0akkKIcKf3BJKiQBOGFZxc85RaUUF6KuFWQyT@vger.kernel.org
X-Gm-Message-State: AOJu0YxMApalxSCHXMXyEdAiR7ztxWfXcTcoSoj6EjgEAMMZodlpOVPk
	ZOxYWobW2+71ZbSOD2AWNUgNC5/SOwHzawp/WdWjMhZ00wWUroZDzjr8zWRO5OLPTyiIIQT2INs
	Z3/jKm8VBxY7Ui/cjUiI0wkClqYPTBW4=
X-Received: by 2002:a05:6512:39cc:b0:5a2:b0ba:7169 with SMTP id
 2adb3069b0e04-5a74661b75fmr2060251e87.38.1777415843678; Tue, 28 Apr 2026
 15:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
 <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com> <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
In-Reply-To: <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Apr 2026 00:37:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkT+P4=uU2s20_iRJ4URYxUTodT=10FaqBnbv4nQChdUA@mail.gmail.com>
X-Gm-Features: AVHnY4JWtwnhp2akHdjilA7irIIkpOgifByCgOYtH_Pc8x94YSONShmddM6F4S0
Message-ID: <CAD++jLkT+P4=uU2s20_iRJ4URYxUTodT=10FaqBnbv4nQChdUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4C1A948CA7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35737-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 6:28=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 28/04/2026 14:06, Krzysztof Kozlowski wrote:
> > On 27/04/2026 22:18, Linus Walleij wrote:
> >>>
> >>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bi=
t
> >>>    platforms, which are already enabled on qcom_defconfig.
> >>>
> >>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm6=
4
> >>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
> >>>    time and feels logical, because if one selects ARCH_QCOM then
> >>>    probably by default wants to build test it entirely.  Kernels with
> >>>    COMPILE_TEST are not supposed to be used for booting.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> >>
> >> Way better like this.
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > I think this should rather go through your tree, because new drivers ar=
e
> > coming and some other changes from me might be touching similar lines.
> > Well, defconfig also might be changed in parallel, so obviously someone
> > will need to handle conflicts.
>
> I'll rebase on recent patches you applied.

OK then, let's try that! Maybe I should just split out all the early Qualco=
mm
stuff we merged into an immutable branch if something starts to cobble
up later?

Yours,
Linus Walleij

