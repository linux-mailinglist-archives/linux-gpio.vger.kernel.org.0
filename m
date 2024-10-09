Return-Path: <linux-gpio+bounces-11102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83633996A48
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 14:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DF3282217
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 12:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BBE194C96;
	Wed,  9 Oct 2024 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwUo3r6l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7771E4AE
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728477784; cv=none; b=VwCqKBlDrm5QOh+VPCm/WVomjpQjtWOqJDKlVGVBvyjngsYVuLcX3u/4hdR61Pe5QdctuXX/YXqY+vc9vSWy7GtvlR7zBu/b68Wz/mffXOxj5+lE6zCWONEnyaXM4zOitXBtXje1k8lQaH6I05qyUP+wAi3UmvnGmoEWM8Hy7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728477784; c=relaxed/simple;
	bh=jlKRlQacEER6Za7EZRqVQpjIcMp+FPvaE/7TRDm3NVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7B0ZgDNDywSF38NyT4KpmxN0GrDKBlFEkDn/nshB9hg9VXE+bl9H4/ZuPuzmTlzy6B3BH22PnlgLX1aVXMaFRrZGKvYwiNJsR38o62S0RbUqoe3t0BS9AgkFrw1UncF6E8I1+V0Qgz4a4cJEDhQoJf6Y6r3mSM3op0pxV6R0pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwUo3r6l; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so74946361fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728477781; x=1729082581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd2ajZJTXWCZQHWCkMWh5ZbyjSLmxQS7L7ieRQ73iRo=;
        b=TwUo3r6lGnbD1I/WC8PiDuFylRK7PSkYgkVWCPRU9ILdC9a3fxnGj59PbzU8dSROt7
         sXpeJ9f+jxr/LFB6VJRS1bkWGL4CbAwkQ9I32OIcZwmjeNsQX6Ui0+9HjO6/znpdd1hq
         pBqlIFoL0Aalt32OGjUPOrBggdhLyEf3KW0S0Dst4T8+5Wdm0CkeUKkkiFH16b7IhLcQ
         qU032dps6CFTHwDp0U1RtwILJVgHE3tKYeeLXN/jchHThi/bSmvxHDsTEphNsMTY6RUv
         JxG+M9glNJd4RR57F5JjcQG8U4SJwhPvpgHCRcvbC8fvGMQjGkmZFWyujh5SipkPYPq3
         8sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477781; x=1729082581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd2ajZJTXWCZQHWCkMWh5ZbyjSLmxQS7L7ieRQ73iRo=;
        b=XwCEzzTEyurU6qxLs9Ym7zYoHsGsdiABxBxEPSN8SjBai1/zH7IPvp3ed0gKUZD02/
         jl6vq5sxha4HKWCNwH48/OWI0m2PndVSZAncv2Loesx2J31ZGNQNlE/xFHjRDT4iwk/V
         ljKMtRbUlfp04i46lfnCrJ/iDd9HN4LniY4IGp+OIfwjyzGjcpqHWLdY53A4fVOCwZPc
         EA3sv6vDXViI6yQySvkOW/b+z3QAy3gRzXkIRBPiDUSrvRDndRhLRAU8ozwd48MhxneJ
         VTd367TA8GYlWrjV+R54XopSwSp4jcSztlYSC8H4Ty+AOAAkjjTVeuY4mjakqy1q0m+O
         WIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUPgcF5CLrxkzHf/QEWvyDAh7J9WecUAnux9YgnEd0qEfppshfM80zZNREmzl/jhTJjEUmkVm5Pn3Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn5g6gan3ds6HEP1r73LKryuvguAcbjTwq7fjOBk5SW0QJhC0z
	6VksPAVaBR+7wCGvOUpTAaPTnK9Vrys72zIiwpZlNlI+WXoh6Bl2G0mvar7ODrVCOhDeYFbNTLl
	UqmRcFF04qVRLZ+a/paYd6c6T8ZdtUN12tnEw2Q==
X-Google-Smtp-Source: AGHT+IEFgCDjyhZzABbrE9/Mt3Cgr5SJ5rFDI1tE+jCgT6KNs1U7nwfDRGp32qlMOZ67IKjpEklL5xofkX663cD6H7A=
X-Received: by 2002:a2e:bc1f:0:b0:2fa:cf5b:1e8e with SMTP id
 38308e7fff4ca-2fb1872ba6amr16140461fa.2.1728477780725; Wed, 09 Oct 2024
 05:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 14:42:48 +0200
Message-ID: <CACRpkda+Rrsfs706o+K1g-252sZG7FqZGO4uYoFEMnNbUzx53Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: th1520: Improve code quality
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 3:17=E2=80=AFAM Drew Fustini <dfustini@tenstorrent.c=
om> wrote:

> This series contains code quality improvements for the new TH1520
> pinctrl driver [1]:
>
>  - Fix smatch warning that the return value is not correctly set when an
>    unknown pin error occurs
>  - Linus suggested using guarded mutexs so I've converted the thp->mutex
>    lock to that usage.
>  - Linus also suggested using a scoped iterator for the DT for-each
>    child node loop: for_each_available_child_of_node_scoped.
>
> The series is based on the linusw devel branch [2].

Thanks Drew all three patches applied, excellent work as usual!

Yours,
Linus Walleij

