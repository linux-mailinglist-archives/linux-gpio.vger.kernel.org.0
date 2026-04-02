Return-Path: <linux-gpio+bounces-34603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDatBjSfzmlZpAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:54:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659238C385
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11BB830D7F7F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 16:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1152A3F7AA0;
	Thu,  2 Apr 2026 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JezOKjHp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02939396B96
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775148193; cv=none; b=HnhCWmMo/ZtEHPwkOTgurCXPJGtvfKMeTreLNAfNYwzIHVuOAc/u7Atck/K8d9NTXYaulylogLxSQ8aSOa8l7lMNAcInD2ZeoD+hH0yiOXTpC/AwxfDfFmwkUDQk7yfqfsgK632PoBK9N94GBI6uZh+Af+YXw4d/akKBNg55tV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775148193; c=relaxed/simple;
	bh=Knv/7tImGMBswFvQRCRGoNzTx08bPZsuiIe3if61KxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSWTL95TsLpJvMmN6RciGXyCKpfpVs1ae1/J9s02ERlliwiR92u9hbiIachKUzamZkAwh2RvoVcnb4f3X9093GSMllD2xUcRfugS8YAx+1Rp+yZg4aK6PYJJE1oKSkbc8vpVVixKN7YIbCzmAeR1MeEw9/zJgehg/kkmd1C6LCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JezOKjHp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D37EC19423
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775148192;
	bh=Knv/7tImGMBswFvQRCRGoNzTx08bPZsuiIe3if61KxE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JezOKjHpRDazlFPDrM3ZY3/g8MB4g/75UUp9Tg8sKh5uB+xWn8w9NNdndjailyQfM
	 hcNj0J15q8FGwDDI5nCRicQQpzxrAS3WWq8KG3/vAHWNVz+ukEO2UfLX06+X7r8Zs0
	 BPIEGXBPUVbKDdwuJOj+nr37wllBckUKKbc4cJBLvqWNjxZ2cOCfAhg6HSacv2UmLP
	 XpTw3xo5b9N3d6I6TApPZyr5kgNzW4nEo/UEZGa/YDsEHYcluM4/KWad4fIjH6lbTB
	 gwWu+MVjPzY41aUPwH4/dJI+rN9Bu1Kn/9jh/SZ/cZQeRk/AlNickpiHq/3sb1QGqs
	 Hz+k/4QjbpwTw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so1336623e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 09:43:12 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzo7T0bbnTrojjfssg+Bj+SgiAnKxIOWowGWKskH8tVWdC353MK
	dv5fXQl9oAkXdT3cYh/zP2K0L4ye+FwAq0B33pKAboP1Pk7dobS4SAonsH8kf+3y+LU1e4iGs7a
	P8610jqeJl/0+2DLAwd06/EmBo6zRgakTjFfeZMwejw==
X-Received: by 2002:a05:6512:110b:b0:5a1:3e69:b186 with SMTP id
 2adb3069b0e04-5a2c76523a0mr1386434e87.19.1775148190788; Thu, 02 Apr 2026
 09:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401001459.19159-1-vfazio@gmail.com> <20260401001459.19159-9-vfazio@gmail.com>
 <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com> <CAOrEah6BHFHeCWxqzR57jOrAaJ7h6+_uwBn8bTFMr4x0oRffOg@mail.gmail.com>
In-Reply-To: <CAOrEah6BHFHeCWxqzR57jOrAaJ7h6+_uwBn8bTFMr4x0oRffOg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 18:42:56 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeQ+AXkXiCbELywekSEOsd3N_DZf1YNMMMYy=mCGWVLEQ@mail.gmail.com>
X-Gm-Features: AQROBzDY5bEvdATwy0JVzHna12KqUMB27nxhDqse1e0JIYmRxBiKoQE-DRCium0
Message-ID: <CAMRc=MeQ+AXkXiCbELywekSEOsd3N_DZf1YNMMMYy=mCGWVLEQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 9/9] bindings: python: update linter configuration
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34603-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7659238C385
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 5:55=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> My typical workflow for ensuring that linter checks pass:
> * cd bindings/python
> * python3 -m venv venv
> * .venv/bin/activate
> * pip install -U pip
> * (now) pip install --group lint
> * mypy --strict; ruff format; ruff check
>

Thanks, that works.

> Some repositories try to implement these checks as part of pre-commit
> hooks but I wasn't sure if we wanted to go so far as requiring these
> checks

How about making it part of the dist package generation?

Bart

