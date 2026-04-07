Return-Path: <linux-gpio+bounces-34771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD3ZEibg1GmZyQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:44:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1AC3AD193
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B17813027CF6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6973AC0CA;
	Tue,  7 Apr 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InrJtFPK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD33A9D8F
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558594; cv=none; b=tD5ouzhEBkGbW4qfsB705p5wz2/6aE7XACl2qlYBrhdaBAauoHaAyhsNOV3VEqKweAzfYwhUdBwo41+X5+EUmT7VfaS2IokP+HOK9lhKQgzMhnO3DKY9qLhBhYLRpxG4wEQ28Cs1P/LVd/a7XjhCs0wgHDjgzG4nrCTgC+YSBTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558594; c=relaxed/simple;
	bh=OGCTSec1F4wOyMIHYzrUkhMcXjE9nQRXccS/tQ1wa90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUXdEErt+CzZqvBAP5azxC63M8Xom9DoK5Q46ny+ArR+Srx6qi1JsDCXOjTEe9di8wnx4z/4DcL4fZxYPxPP00EK3avP8b7mc/NLeukf/ZZLzhvlAp5L9ImSRUtGZh8m/adXE10yhPC3Jb5U43Hv8EMjkm8YkEBxUk1X7EBwjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InrJtFPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9D6C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558594;
	bh=OGCTSec1F4wOyMIHYzrUkhMcXjE9nQRXccS/tQ1wa90=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=InrJtFPKZRalAISWGcUdoQ6kCiwg+6OkTBPumuC7EMtTGRT15uWlCDzjlW3CIu5l0
	 LNGoMkGTPZrwx2Ly3pmTKQ1sDNk5Bbw1U8/52La3yxuhZfiDCM/w0NpzpUFsM+LhSR
	 JY0jPShPWPwuz4vjPvwDLgdm5bzk4D9ZfvD2W/g3JuPmC6tae9uDGn23G7WEp/9z+w
	 iR9Ocz8c8sYVWpCxXD5y04bBhy2zljl0/REWNqexvLyzkHEQzFd2sGQkj8xz6w2k1v
	 14VNn+T45ESjZAMo84RKALDtxxjyxdFEJuzvjrHWWwT/ZVZkzTzdYFEPsWNQsorWCM
	 JAP79h9Unqffg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ccde812ecso47385201fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:43:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVeVG/Oi/l6hxKcpBnwy8gJXV+O4i72RvTOEeddQqnujNXB4oblu8Go9mUBHz6DbUf9Ts1TrZvdYAw@vger.kernel.org
X-Gm-Message-State: AOJu0YyUOfR2s+vjxFvezJ/yH8CNY/d4rbXgg0P+oMr56Cdu7dZHU/xv
	MtJ5YieRWk3OQw/Xcx3lHJt8EY5I9OyXb5eBVYPWAtqjqPe6DrEHVv/lwJTyRhQtcRLG6Fjxjy9
	30ZykxkA3+QJRzw/LytIEnSpuFF+PB40AJ99qV88BLw==
X-Received: by 2002:a2e:3207:0:b0:38c:13:77a2 with SMTP id 38308e7fff4ca-38cd6a7a15cmr49104791fa.5.1775558592729;
 Tue, 07 Apr 2026 03:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com> <20260405-ti-ads7950-facelift-v5-4-1f980ed3cf9e@gmail.com>
In-Reply-To: <20260405-ti-ads7950-facelift-v5-4-1f980ed3cf9e@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 7 Apr 2026 12:43:00 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md=XyjK=EaVNxJX4bD7hvgDSL7J4eSiigOfk38E5CKAjw@mail.gmail.com>
X-Gm-Features: AQROBzAdZd8mVdscgAxhpK3At80nhKQrpbZ00LW_oc3m6McHYMTEVJ7X_m28-wQ
Message-ID: <CAMRc=Md=XyjK=EaVNxJX4bD7hvgDSL7J4eSiigOfk38E5CKAjw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] iio: adc: ti-ads7950: complete conversion to using
 managed resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34771-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,baylibre.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: EA1AC3AD193
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 6:39=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> All resources that the driver needs have managed API now. Switch to
> using them to make code clearer and drop ti_ads7950_remove().
>
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

