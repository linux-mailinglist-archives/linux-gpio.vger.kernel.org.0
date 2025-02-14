Return-Path: <linux-gpio+bounces-16050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D0EA36679
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 20:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 002D5170474
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 19:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8011C84B7;
	Fri, 14 Feb 2025 19:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RRmXApM1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2571C84AE
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 19:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562621; cv=none; b=nXcGXy5yegKclVEKGVi7J0kQWKKw/24AcMvidLUDlFiEDQZs5c3gYo8Wt1j1/OnAs903yIknGP0vyxWNhUqX3AEZW+M54ExQGslq/VJaXMCaAJeX+EaIe69kdAD36SCqplcX77mPdw98Nb5MAAwyqy4X5QUl3tEG23txUbUGE68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562621; c=relaxed/simple;
	bh=kS+/RPbJQYyV4loDfeQBtye1zVtLY7WDjjNFf5eieKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9T6URYbQM5uaPKbVCUAH76oHNkbTkzcpuN2TPei2ZBhQfyvXHN8WHllyJP1LfBwSa/DOZrVkeDs9IDm9GbIxl8D1xgyJyLJK8L4kZVX33zQrpZVYgmua6X6pejhGn1ry6mevDclczjmU8RdfiugNDUenbWHjbeWsTXEgTQHVGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RRmXApM1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30761be8fa7so24883081fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 11:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739562617; x=1740167417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS+/RPbJQYyV4loDfeQBtye1zVtLY7WDjjNFf5eieKY=;
        b=RRmXApM1VzEUhNlmKR/wQ4LIJnjDwFW3NbAetG/SMMao+AmamzaFFMPySC5ButQMuj
         VjlsgD2iB1nO3Aev0mn6oWjnRIyDgjn7Bk2D4lNR6RJwH5UOj0YCGdMFFC7Ei5xeyRP1
         hSqB9LRxO7PMdkN0zeXHm17ShTzNF9x9F/soU43OSyzLEyUiNQiwcWyI/BjQU9r41saL
         h6/yCgvZebO5VPWapZgBlTjR6QSWba79Z5/jmTCrNXxaWeyoDl4qa6Sb8i7cEgjicGHp
         a1qY6a+1nENXjSW90tZVBC0LjIA5NHAeOeZRoUYGJulgDls+pnyzmgLIB6/+X5YxPkcW
         nzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739562617; x=1740167417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS+/RPbJQYyV4loDfeQBtye1zVtLY7WDjjNFf5eieKY=;
        b=shTJMo3WtfkWEfeQr3/rzbGP4mAqe4eRjguC0aI0+Msr7eP7sxvOG/ozPwZkZUcmAR
         VCLK7SyQK5/Jy4SzGX5iucUvsmTc4WMor2aPhXiN44LwYOxP1WKvQQHXyI5VPxf9l42s
         eJW7nu2PvsEo/lM8WqOI0bcc0hRmoKqDY5F7ppZDY44vAYq0jvJaCpDtsKZ69YGOHg4h
         pvET49ohmXGVQuG/KEew48Y+ohELxZCclP4vlkVBB5BJNu6RWw/EVze0iZZLuwbICTk1
         jpMlw7LF6GAjsg91xwtb3VAIBNt7uY2H6cQGlkdZpdw3Vt6qrKx4o5Wbcb6Kxb7jMm1r
         jsig==
X-Forwarded-Encrypted: i=1; AJvYcCX2xq+x6CPiWXtqc9l4Sna+3XEgHFAb6iHead8CwG4Keg84s3r/E/X3SVXLQYshnkpvU54Ve+hwVmgp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IjrEEBRgnE5NH1NXAyhm1zq6K5jq5iOckt+WlNFzt8HGK6GA
	Q/0KjEpU2Hhcp/0ksd2JAvvJ385Z5DSRtMZ7Kki/KAhy5h/7rpVmeSkvICFdcH7HK2EUtrOYDq6
	hQkC6PkOyirMohFiMPCNU4xe9LFSl/wU4PJQVvA==
X-Gm-Gg: ASbGncs6UsO54vzvWvGgkgjDA+Q+ZV183CEU+AhQS0iTwzjIZK5MvrwyM82pLIlZ1ky
	L8NGw74Rc26jGTtPaEQyUcoha0zyFO6cSNUQ/8H+G3Gzu6jVzu5p4AMl8xMDKEQyeigBkn6ksOu
	3wq30pfB0Bz+Z7nA7aVNCN7RlUMfQ=
X-Google-Smtp-Source: AGHT+IGlWjB9v2asjVJFwzrcdKSekLt81bHRgl+1Bt0xg1xeMTTWOeCFD471Hob7Y+mGo6EDLzkfEPEyFyoJEPANwtY=
X-Received: by 2002:a2e:9119:0:b0:308:eb05:9d3e with SMTP id
 38308e7fff4ca-30927ad5405mr2911351fa.23.1739562617279; Fri, 14 Feb 2025
 11:50:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214152642.90363-1-brgl@bgdev.pl>
In-Reply-To: <20250214152642.90363-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Feb 2025 20:50:06 +0100
X-Gm-Features: AWEUYZkw917luEw1Ce7PiWplpAK5z0ndMU9Sa_ZKL-PQQDyBap1Mce-PhsTSfqo
Message-ID: <CAMRc=MfGDmn-VODwBhqsSTs62+6DqujGdAQPmir+WBjnV7eaFw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 4:26=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Linus,
>
> Please pull the following set of GPIO fixes for the next RC. Details are
> in the signed tag. We have fixes to drivers, a new ACPI quirk and two
> fixes to GPIO core.
>
> Bartosz

Linus,

Please don't pull this. I just received a late sparse warning about a
commit in this PR. I will drop it and redo the pull-request tomorrow.

Bartosz

