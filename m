Return-Path: <linux-gpio+bounces-11468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A832A9A129A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE3A41C2153A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E612144CC;
	Wed, 16 Oct 2024 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fto4zm8j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BD2141C3
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107190; cv=none; b=EfA5KEWkQ7vsQ37ZdMiwRAFwVIFqwbo3cmIU8AC1Uf2uRTG/qtFCPLhXQmKPWarUj9/Es6Y2Al0ijQJ7xP+Bjwgq2SPM5Z/UNj8yyZJcUwQlfjim3FzKoLG1gnle1IGBgUMK6z8ETO0KmgIEd6eVJPXqaSv4HRFd9gUsL7kJgtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107190; c=relaxed/simple;
	bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2A3SL5LaANGK/w8cBZZi2JiPflRSEAF7vArujUxEVNQdWMIXDxr2sctxn66Mw61vXayvJVgePnPsdkATBLo4gQrKQ9z0ZpZjzmxLzA7hoi1RRoeaeUQ9PkP7VfFYgnh96GYIsATc432V2fKZ+qiQVIfFz00y1+6gqRbO9i/O5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fto4zm8j; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e38ebcc0abso3451207b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729107187; x=1729711987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
        b=fto4zm8jEXnrZwyrpLSk5wFdsLKwuNQ/MKYiEiwgJu3nGAyxURoDzpcc6WuvQ5EPlG
         TreAAUM8XekH1LN01v64Yz2d7TQO+rZtNRKQTKCPT07zskLzxDeoViqpLEfgaRSdv2S9
         lugKzScVhNtzA3qj4wIDd82kJYoWmapBCb2k7mVTe6Py9AcN6Ncem8iDFH33q5bQMj/9
         DNshxbxJJ4pTbjPG0mg0AKDBXA3O79cstPamh4zVOpO0SLMbmVvyUCc1rqbGS3p/vgh0
         YX4sXDk3T7Ul1BYZ9wIsDq6UumjJMPGw+N3/rOraIYe7t9vhK/3wAtCSWmUwm4oNMZ8g
         bKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107187; x=1729711987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
        b=H/H6V8OD9ATnX9ksAi/8Qi5lKiuCQGatO4/ou7E3B63H10agnWmjiMMf8RdGnLVHqI
         J0miJXppIcGCe5JzI+Bjhs2JdnMcAgOE4tOnNIvO7s7TgK0f31DpUBmJKMIGWO+Ik+y+
         T9Ba5hd4+HdGH0nZ0MR6CiTcYcelNKYULVBCwYEcF1e+EdszWon154wMNIqaKs0rCq/Y
         SsTHN3rGUryjDr/ayvAMiE7DvYLIqCWj8zZE2ygqDMRXK6hA9aidZh1SWchSRL6mtbQO
         ZE3RGOlk9RObiKvT9pDJbgY1aCWsG//1PA+kOKLElIoZKj5N/qlCPqotVVJFLEpz2NFW
         rwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX2l45ONwo5k9b8J4inRMsZMSddwaHBOQfNoB7ISWFGwmbrONxwDZpBXj2XEDwg+DjYvn1G0vBz5Dm@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXGBynbBSdNXJUPq1vJi7T85b01Lh3dQU4WF7XNzmCPmKJ/L4
	cHa1Ncym2bvU3tiZuADgAL+okwbkZTxUKDxp9jKpQezooYoflEqvnDFcYjHahjmOVnTFmvTENwZ
	HaKO5lkOEzbkO/JntXVP0ze7A1VuhAMzWA1i+KA==
X-Google-Smtp-Source: AGHT+IGX07jif9j6w8MTv7ARHJ9/+lXGQIE504CDxiXkTKXqPtoikEAqB670DW1Rp7uFgjkSTFhaEJvJ5+tdTlNVD8w=
X-Received: by 2002:a05:690c:388:b0:6e2:e22:12d9 with SMTP id
 00721157ae682-6e3d41d08c3mr58083187b3.35.1729107187330; Wed, 16 Oct 2024
 12:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016155655.334518-1-colin.i.king@gmail.com> <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
In-Reply-To: <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:32:55 +0200
Message-ID: <CACRpkdYxsGC5Yay0dOaQEegrLKKkLrcivX7_GVpfQsEa=psdDA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
To: Colin Ian King <colin.i.king@gmail.com>, Kees Cook <kees@kernel.org>, 
	Kees Bakker <kees@ijzerbout.nl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 9:31=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Wed, Oct 16, 2024 at 5:56=E2=80=AFPM Colin Ian King <colin.i.king@gmai=
l.com> wrote:
>
> > The initialization of muxtype deferences pointer func before func
> > is sanity checked with a null pointer check, hence we have a null
> > pointer deference issue. Fix this by only deferencing func with
> > the assignment to muxtype after func has been null pointer checked.
> >
> > Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Patch applied, added Reported-by Kees since he mailed about this too.

...which was actually the "other Kees" (Bakker), not the one the mailer
suggested.

Yours,
Linus Walleij

