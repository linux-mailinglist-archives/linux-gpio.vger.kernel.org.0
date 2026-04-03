Return-Path: <linux-gpio+bounces-34630-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CxZMpCDz2mwwwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34630-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:08:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F334439297F
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C7DF301DD07
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 09:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DF3388E45;
	Fri,  3 Apr 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtZsgltT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D6386C14
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207207; cv=none; b=LlrGsdBA17yUGzahMtcdp7pS3LQGhZPqa1yINBu0oGgps+2J6Yiyxqo0hGQ34Q6K28C8DI7dQdT+cuxl7R2MMFgcRwlmgioQtZqOOcXvjYTJvCoDa4qWitM/iLxH4WpBWElfSXtV4b2KDCVK6OQT+rByeQuvOL3AV7H+T8JUsh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207207; c=relaxed/simple;
	bh=NYAlpvWTXasQgBMKLMIFwO33p3h5rsFmA562vYt5zns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5GxKKctLlKU7Sy+tB/C8cRl9uWxfzz0zZBLTzuGsnSJundloNaudWD76vZNSrTUSdYyrmXsJ5qJiRvhyG53jNiGWpS4NylzOPJCXKWg+jwgRXkdCZgNSZ7ZSYioaEd3VNY224o+cN1AZojfvVxiSNr+itBiCTpI3xMd5LpxqKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtZsgltT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E418BC4AF0B
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775207206;
	bh=NYAlpvWTXasQgBMKLMIFwO33p3h5rsFmA562vYt5zns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XtZsgltT19d5e01YvKUAPwVanvYtTmMDKIBEEf+cVJFvM9j9w/F4A6wfck43JW0Xx
	 prEEdtAp/Mp/ulYtREAXILCNCqo/T4UFQ1XdSGbHRnrqIx37CKiRP2Dlh9PaOPLw/U
	 K9qKBJwTQc0zx05+JvSY+ZzzcJ/IcbX/IQrx+egQDpNhOqhbJm335e6lB8+yK1kTOa
	 0aqpKWtqyv10io6pGtUhUj591qmv/17fVPcG37eipSrWjoMNmTOk4KU19Qy8LbtMrc
	 mmuRT5d9LVyKMkncT+BtzkUzPlHmcu5KsqvniRfPDq8KbgZf73rZGzqGxm5KySxJGx
	 0fc1LZmxh04UQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so2244942e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 02:06:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YypgsB/WhNxXeAXgDDVOaJqdXz3AxlChHXQZWPi/rm/2UMIyB9c
	0/czFC19fSSXGINq1LnFGcOiOfJqh3HhKZcpUhjsJGFU6vlwIrew725xlx7c34fRxUBLYv9x0I8
	LWwHPODt56+Xzxd54DgYgF+mEuZVBOn4LGP5EjB5JsA==
X-Received: by 2002:a05:6512:1295:b0:5a1:33b6:2b6d with SMTP id
 2adb3069b0e04-5a33755d8famr707243e87.14.1775207205636; Fri, 03 Apr 2026
 02:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402230321.6579-1-vfazio@gmail.com>
In-Reply-To: <20260402230321.6579-1-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 3 Apr 2026 11:06:32 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfPD4M7MX_i6MkFpU8RcZjdu3mnxLJe4Le=A6tu-OWBjg@mail.gmail.com>
X-Gm-Features: AQROBzB4ATXt88r1jhWNeL3CT8xczXYijC-nXNM7kP7RLFBaWHRS26nSMks5mvI
Message-ID: <CAMRc=MfPD4M7MX_i6MkFpU8RcZjdu3mnxLJe4Le=A6tu-OWBjg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: allow releasing LineRequest
 multiple times
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
	TAGGED_FROM(0.00)[bounces-34630-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F334439297F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 1:03=E2=80=AFAM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> Allow releasing a LineRequest mulitple times without throwing a
> RequestReleasedError to adhere to common Python semantics.
>

Same comment as for chips. A comment in the code would do too.

Bart

