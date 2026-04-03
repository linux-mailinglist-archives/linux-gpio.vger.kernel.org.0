Return-Path: <linux-gpio+bounces-34629-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ9XGoGDz2mwwwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34629-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:08:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184439296A
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 636ED3010757
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 09:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B57A386458;
	Fri,  3 Apr 2026 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UV/PzzKq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F012382F36
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207165; cv=none; b=jFIax5Fw9eq5fgu4UMUxh02c5Yw5vCUToOx9UBh2nBuhFd/oHKcXO/v/xJdcC8oroVx7rcdmiFbylH8I5z4+2CCSfbGuQ2Snb+PhHojAMvyTvCuPxtLobXuP/F4CRl4cr3dTZqEIYS+RG0OCMix4V0jp01smCzvUIed4/VC3GLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207165; c=relaxed/simple;
	bh=O6+FqF4AB185+ZuIKCFpvEm50/caUNY8QA1lSM2+ZME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIM9OkzEXGFSO+rGDVEkBO1tkCSNLO49Ro5UQCB0ZK+yevcpJTs+VlBVpGy3BoKsytggdU3fU1HlVutrALP0AnEKwJdey1GSvc2sFUr5guPsgy8DtBXpqcaOPYwh5unCnpBPf91I/RGYzh0PCUQxl/dVGHcclslX76Io0vfD1ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UV/PzzKq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F80AC19423
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775207165;
	bh=O6+FqF4AB185+ZuIKCFpvEm50/caUNY8QA1lSM2+ZME=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UV/PzzKqsCzUC4riObDnyrgUDQH7S9mLFEQPPC4FnLYU0amarxxw4K1HI1Jcimm4j
	 2ADkzFKyisrgdXGQQ1omWrnZmBYVWMbrJ1Je3FLSa+axmt4PPt9jAD7jcCdHJYecLw
	 tMJq47M5LhkBRaHcA+VarFq5M4X59Aw32uz+dLY4UNm4kVYu1R6x+sunmHO2dyyoI+
	 Qh69jZLsit4YJghhpy6MXAPHw4MBm+osucslia61eW8b/goBEncupF17en1PdzFaH2
	 m/OcH2Cc+BTkZFWlPfGc8sCyeYqx1JSRWIi3uhM1XfEGGbPcsIz+gTrj8tU5b96uoQ
	 bGRWWf5o4A0YQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so13585261fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 02:06:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YzCIyw0ZFIwDaNW9eaH+f/IBQmWM4cuqGWmXwBsMZ7LzA0m2mtw
	wNf+L9wx5iWiXul7vXa2HFg5MWEpYy1c68tOljExFAXHJOZFGsgu6zfEkIENKEtAOFIvzh+9X5a
	bXAL0jWVqAWTN3zC4l8/SF6A9P83ZMtNrrpWPdJ/gYA==
X-Received: by 2002:a05:651c:25ce:20b0:38c:3e3:953d with SMTP id
 38308e7fff4ca-38d9786c6ffmr5043951fa.13.1775207163915; Fri, 03 Apr 2026
 02:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402230315.6501-1-vfazio@gmail.com>
In-Reply-To: <20260402230315.6501-1-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 3 Apr 2026 11:05:51 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeNW6XKhGG==qF5LHBQXpr18NVD26JXXTWNL57na4KExQ@mail.gmail.com>
X-Gm-Features: AQROBzCNtJ1x8cqmCPaZo8-gaIQ0uLILlXQaxWXGTd-DAUZ5AznrBW9E__JLfdo
Message-ID: <CAMRc=MeNW6XKhGG==qF5LHBQXpr18NVD26JXXTWNL57na4KExQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: allow closing Chip multiple times
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34629-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6184439296A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 1:03=E2=80=AFAM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> Allow closing a Chip mulitple times without throwing a ChipClosedError
> to adhere to common Python semantics.
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---

Would you mind just elaborating on what these common semantics are in
the commit message for python noobs like myself? :)

Bartosz

