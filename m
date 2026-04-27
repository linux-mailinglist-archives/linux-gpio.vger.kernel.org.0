Return-Path: <linux-gpio+bounces-35537-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMc6EsEX72kQ6AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35537-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:01:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079B46EB29
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00AA53004DDA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D76D370D7B;
	Mon, 27 Apr 2026 08:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ps1x+wiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405AD2D780C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 08:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276853; cv=none; b=DTwfa7KhStDn9E6H55kjpFVTgoNSdwNHoustUvPIT9682qagv0QcCuMqhdPldyIwdVv0uRS+fpONVwCRCQ9JE4ueyzZzcnxpmR1uA40eX3VQeNz8pDMaWOUjLowYJXcQ/Hs3OzByY//e4vKy/oWmnz1dpNIFdJNFXmQho5nYrmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276853; c=relaxed/simple;
	bh=7QFIWGK3D5OC+D4MdhwxM/aJfSr8GX8E2/vh8tHdMT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WL16z3QbnjJm0oft7kSmdVaCZHTwFHD2yx/sLKbXby6f094QLi+66IP3vYmVY2jVbLeJdLiC1R7xyBTGAlfsQfycWw2EpgpxVtzhO7h7kLKBml7+0zDa3pFAe4LLnWL6h7ss5ivMr0DMkivWGJgOP7AvmC+IXtdUiR9FJC119Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ps1x+wiB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EA0C19425
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777276852;
	bh=7QFIWGK3D5OC+D4MdhwxM/aJfSr8GX8E2/vh8tHdMT0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ps1x+wiBfrxbzS+Q+sASwuVJdUPI5Vz0iAV3C2DP9g5w0cg2l7uvQrt1q6M8r4Dzy
	 fSyDSvvxTpKNV4Bdsoc1J82wzr7uN93IlVkMoVRV/MaNXodOCjTOEnTMWl2AlebarV
	 zdjcL0UOmcIzQuzOWX1YnMgUROk4STEOpHwByWdrpQMwyrRrEZ4o2kX4nrGXKr14Q2
	 QExFvsPaTqoHoZ7aO7JS7UNWaJtWRIVcaOvS/azsG0JzGoh8zun+TOr5YjNUx7OKew
	 3VAFbKdt4Ffp6PL7Cq6kUtIIpCe4P32XDZKpC7DjfX6UTalv9r+BsHHiMVAQ3hbXdK
	 7JmXjtn4xGhCg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a40b2d268bso8012688e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 01:00:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8atU3JX/XObSLszIv3OKpovqdTZaS6VDGLf7Ma2vIavC8xls4oW5rOBzssnB6b/R0k470TmrKggWTe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc8aT5Tr4ogr/kPeniHSG/hAj7JzX5EvnhMSEr/mraHl9eLqSG
	gAf+RAOaIvgyh22oL7NvqpIb1w3xgL9D+ZHpsI6KwTn3tlsbQNWXufoHBwb/ecb24afpDh35AjA
	jmRuPw8Pa6TRsLjoK8hwE8RjlTIK27uqxqCYfGaqwXQ==
X-Received: by 2002:a05:6512:ad1:b0:5a3:ff5a:d6c with SMTP id
 2adb3069b0e04-5a4172c756amr13040137e87.14.1777276851567; Mon, 27 Apr 2026
 01:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424222247.37295-1-m32285159@gmail.com>
In-Reply-To: <20260424222247.37295-1-m32285159@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 10:00:39 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeMUosfdsDpvcbKNRFHJR-0vYZFxu-4btZGSR3yPuVgnw@mail.gmail.com>
X-Gm-Features: AVHnY4KWXjPYm_CWP8FEyyweFmfjMqdSxc7vSs5jNnCi4cKoAp6qz2GaxK05Q38
Message-ID: <CAMRc=MeMUosfdsDpvcbKNRFHJR-0vYZFxu-4btZGSR3yPuVgnw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: Replace sprintf() with sysfs_emit()
To: Maxwell Doose <m32285159@gmail.com>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2079B46EB29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35537-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]

On Sat, Apr 25, 2026 at 12:22=E2=80=AFAM Maxwell Doose <m32285159@gmail.com=
> wrote:
>
> Replace sprintf() function calls with sysfs_emit() in the configfs show
> callbacks. This will help harden the driver and will bring the driver
> up-to-date with more modern functions.
>
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
>  drivers/gpio/gpio-sim.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>

Hi! This no longer applies on top of v7.1-rc1. Please rebase and resend.

Bartosz

