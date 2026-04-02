Return-Path: <linux-gpio+bounces-34596-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF5mCt+RzmnAogYAu9opvQ
	(envelope-from <linux-gpio+bounces-34596-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 17:57:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 938FB38B8BF
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 17:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89552301371B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 15:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56DE3BED22;
	Thu,  2 Apr 2026 15:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q601aes0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830A3318146
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775145322; cv=pass; b=aeD+dLSvZvVnklUgkrnp2UJur4G+YPacoomUQsGlJVrwk9hlEaGHykvilGNIW95XmVRoIAuEt2DmnwLPeX5sX6Meu77eZX2ahRB1Rwuo+F39d8qcQ3tDHWjjegGivxTBq+ujI7ZhQJ/CD9mX2mjSAq0cjN368IXy2ZuC9HKmuqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775145322; c=relaxed/simple;
	bh=iQpYKeGUJaDb3ega+GZrUnddk9L0sOhFcohh3lYgQBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LT/pdDcy/GOmSNn55Qu/sLsS0cbgKZplLvc4q+Rrr72tmNr6y7odzlP+W1mD/4rTA5ahnXXvYtp7wHBEsnq2mCQQ/AWglOsQ/I16l9Fln6Sh4+kiX7Hm3NGmjjtteE9iUtSIBu+2YgiOo11v3nkrY9LDuEWXW2Ss38IkFf/JIHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q601aes0; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6501547d7edso1093700d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 08:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775145320; cv=none;
        d=google.com; s=arc-20240605;
        b=LCis1GLaX5nDcNgejZMbBR1PSmHZo4HJwTrGPEUSrXgp1vkWKLDygEnnYVjRettj9i
         Vr5dBIdHNFMX6vzGeSu9MpD11fQGugTXYDPe415j2eTw16Jk+m+pwDXMJbt+ZTXwrV1Y
         EmI5g7jP1fgBPXhYBXGTtHagduc/7w4yo/Vi9IM+akOkA5//kWVfFVR3DppjWeGGQ3r9
         eMWj1KAhq6QyqFpUq5aU5oMMpkYv/W0gIuCLkDKTuBk5qf/y+fzrPQW0Z5Ub6lAvv07g
         HCGp03KtMq0qUJIyfRmVxHJyCHnDx+RtnIdjZVCaA5p7eMCUsq8WYK2ydnPLSSQoPqx8
         5Q+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vk885SISY9oQj+riibrHWNe5BAuKBlyBwbBtGI14zec=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=bOIeQ4h/8+r2/e2DMX6VSUmA8tY7LfVuKIKyqwp5SLn8Ag3eAtHHpYlHZjjwoz5HZ4
         ZS+S/TJyUAdh9AbC1Fp4UvUozlYsFQY2r+htARtNbAhD7EDMCuzxuAX5aWocQGtLRhV1
         wa9+mg1PXJPbtDjsusVGBlAqip0qOWs75N4HoEowmNSuEwIks9vot+F3yo4Fg/Zwpoa2
         5nssE8kU6lO/9Ud5HvgwlAil8rS1BIwaBr4P+rJZ2TFTwNSoVJ67NamtXRs+yGYPKtHC
         YpfMveicgJ9Xi73pEZt2MEdo2FHSww5uzmx+e/KBcEsQlIqyFeknomVnyuIKstbr/lAM
         +GSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775145320; x=1775750120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk885SISY9oQj+riibrHWNe5BAuKBlyBwbBtGI14zec=;
        b=q601aes0bM7Y7FlfKRfaIp8Ns90sdRI+Bkp61/Q+Aodkd8pZpAx1rZ7hNjZSjW4VwX
         w24NFlkCnPqYAHu+hgDs1M68/P0RHVKQHGspke0jwsLEU//ZGXu7QK2rmvXi5QxrWqk2
         5AmhOliYyoLt7OxhQAdby7htqf926r6v8WdURL3emWGcm1jOTyXKHnJq3PZdfDqZ0/Uo
         Qk8EUm3kzCnh6E/0boYedOPKghvZXdkrNQQs+7vxUcifOYaY5l3kmWkoJkUwFMe/m5PV
         KFtjEv/k0OrA0c2ByclOb83yZ3T+uBnPCjPPnejeyW2CP2UHfOMHs2Y6jpKjYlOeQZfz
         3jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775145320; x=1775750120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vk885SISY9oQj+riibrHWNe5BAuKBlyBwbBtGI14zec=;
        b=n25JnvZzO+Q0vQ4YNP6PipZjXTloThnu2wLfbw4dDM+cbE1k/zUCFfWYfqTGL7IuON
         R+jZTOmTXuj2TKjboW37jF5FJwecLksA5Tm4+9AoH94YgH8cNXwFPZxltrZI60ldeLPN
         Cqpvk2qINuVfm9Fu4DtePOtWQRcSE9pPaY3OCmu91KCxbWAkTTW72zQVVg/wXk0oqYy4
         5Bg39wzy/b2WX4AZsZ19nN98fJxILOSlfFLffTOc3I6tMrahbqc6WZ27wO50LMtWblA+
         nQu6xbJEpm9QeazeHZs3iHVM4UeZzI/jM2QOWqMuJ8Fa1f0gwJX/OLmK283eKTbZFEPg
         OVzw==
X-Gm-Message-State: AOJu0Yx4PAmQ0S3NO05sPLtPggnOWpgL2DnNWSyh55sVTohPinYbsxis
	X/gbJ/LJoUZqZPQu8AWPITFrA4RkmrJ95wT9L01cYozLIJK8vuJHrwRgO0Yqak+QAW6IGAzng4T
	HXKVAkpCLrpn3Jd0eFNHu/kXovTK9+vFSAFej
X-Gm-Gg: AeBDietE5KzbwJCqah93YDuG2EK2ZEGQpP6SmswvEbCx0byw6JWL7So5d51jkjXIME5
	kxU4hM+2IWfyM50PqJtqnu0JJKB2WXXNxYSM0nZoxaqZsRXYRXYOkFLQZ1FBfXpjfjoxswb+zh7
	oqYnBPdVh+tVAW0BccNBk4Js1uDO/RunYw5XGckf41P6yYv2hN5fWjWr0NPjkc8K+ck9hkCoh3o
	ceLYpmVQVEaSXk8bNWFr5Djzjrxqc939s9g3d7PSkvJ/34T8vhoCSKMil+0/+p7KhG8X6tkyPBY
	oS2CEGpKwcuO5fH8TFT+Xqn/PwJ4MVqCFmAa/z4=
X-Received: by 2002:a53:d8c3:0:b0:645:51f9:b4c0 with SMTP id
 956f58d0204a3-6502fe652damr5925633d50.55.1775145320195; Thu, 02 Apr 2026
 08:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401001459.19159-1-vfazio@gmail.com> <20260401001459.19159-9-vfazio@gmail.com>
 <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Thu, 2 Apr 2026 10:55:08 -0500
X-Gm-Features: AQROBzBGDLaAj5R4N9mH4D5v6g9Ppux-Tu2y4dWFQNcHotJmPekk0xbaJlOZPi8
Message-ID: <CAOrEah6BHFHeCWxqzR57jOrAaJ7h6+_uwBn8bTFMr4x0oRffOg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 9/9] bindings: python: update linter configuration
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34596-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,mypy.readthedocs.io:url]
X-Rspamd-Queue-Id: 938FB38B8BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 9:37=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
> Ruff checks work fine but I'm seeing this with mypy:
>
> $ mypy
> build_tests.py:22: error: Library stubs not installed for "setuptools"
>  [import-untyped]
> build_tests.py:23: error: Library stubs not installed for
> "setuptools.command.build_ext"  [import-untyped]
> build_tests.py:23: note: Hint: "python3 -m pip install types-setuptools"
> build_tests.py:23: note: (or run "mypy --install-types" to install all
> missing stub packages)
> build_tests.py:23: note: See
> https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
> setup.py:10: error: Library stubs not installed for "setuptools"
> [import-untyped]
> setup.py:11: error: Library stubs not installed for
> "setuptools.command.build_ext"  [import-untyped]
> setup.py:12: error: Library stubs not installed for
> "setuptools.command.sdist"  [import-untyped]
> setup.py:13: error: Library stubs not installed for
> "setuptools.errors"  [import-untyped]
> Found 6 errors in 2 files (checked 45 source files)
>
> I'm using mypy v1.20.0. Is this something with my environment?

Yes, slightly. I guess maybe I didn't state it explicitly, but when I
added patch 8, I included a list of required dependencies for type
checking and called out the group in documentaiton:
https://lore.kernel.org/linux-gpio/20260401001459.19159-8-vfazio@gmail.com/=
T/#u

If you're running mypy from within a virtual environment, you'll need
to make sure that the dependencies in that group are installed for a
clean check and can use the dependency group to help with that.

If you're running mypy from the system level and outside of a virtual
environment, you will have to install the distribution packages that
provide the typing information.

My typical workflow for ensuring that linter checks pass:
* cd bindings/python
* python3 -m venv venv
* .venv/bin/activate
* pip install -U pip
* (now) pip install --group lint
* mypy --strict; ruff format; ruff check

Some repositories try to implement these checks as part of pre-commit
hooks but I wasn't sure if we wanted to go so far as requiring these
checks

