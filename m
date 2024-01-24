Return-Path: <linux-gpio+bounces-2537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF7683B37C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 22:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22A71C21E14
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 21:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35201350DC;
	Wed, 24 Jan 2024 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpNxE7wp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88D1350DB
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706130012; cv=none; b=jlMCqktlexI62HwbQhne1zb+ofniK8ZQ6VSqklv56wHpyKDHmYQNbNpSgv4O8ala3ys6dPLtJ76E1ojuVHixma6E69lqGEYx8JCRpzZDG9BwP+QylbNsggPhn39bcpyUWlBn3zqAaFercuzb3HN7DIuG/SM3TUSXShILRTrC/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706130012; c=relaxed/simple;
	bh=ZeTE+u7lbQJLvyu9KasGOeQm2TXsaTHZ0Eu0Qec3HyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVIVrzPNXjCPO36Qi96r7811YmoK4bYunxs2LSR80JR4SEga40RBes78ooojCn7C3ENKloJq8fSFO3uyyze7y9W92k4q9jbayvCVAP1ivhSqAdUWi0d+/nvToaiTn6TxAcosWP1OP9Oa6tgrrk2ijS+szQE4V7GTVIbnQ2PK2q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpNxE7wp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so7492054e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 13:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706130009; x=1706734809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeTE+u7lbQJLvyu9KasGOeQm2TXsaTHZ0Eu0Qec3HyQ=;
        b=LpNxE7wp1/fsyeZpWg8YAXTq9nIJKGTu4sOAlWnOfi6NHp68CGgBMEQjmdu5eIts5E
         lkEKFg7+kQzIzOHAEhKjp5pAAr9JqSFq0rIhBUecK5B+TTN9Rx0cCYFfvRwGqGT2V8eY
         W6FhVIhW5/m7uwVG0rwrIKD8s88pE2iFsRYkZ7L+/vXOGkD+BWekM5f12+wlteVN4QU5
         x/F9E1622W6aEtYUBQM21UUx21RYXAaAjef12Chhi6B8GjgQkVsoVIcuIDWrXMQ7e2mm
         Z7vvr4keTVYj7dLDlEvJHpGsr4uFaK2RPb5eBVOkck/4jtswpWUPNOZTMRoEiy4ss8Cr
         mLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706130009; x=1706734809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeTE+u7lbQJLvyu9KasGOeQm2TXsaTHZ0Eu0Qec3HyQ=;
        b=wLuGkrob3ROka40x1b3PMdyKmBbndyqhiLERTEz9UojGfFfOkDmQvdzXg9NfBwYEX3
         bcxPyqPo55vRK232IrXo8+rka7Zu4jeafz/aMhW8dRsWGw3EKiZq7ySzM85bxjIKvfAf
         jIzIH4RRcU9DbnayY693+ocqQmH+on0tVzrSuqNL4NikmWtE7qxepQWtlDy1KNk4ZmMz
         3NikJO+B1hgv/ZKRVHJ00catlXBRgs1uU/ZtbGh9w+I7xLdiT8bOxzWRalehH9qi0WDm
         ZHIG8No2Q3MZKJu5zkMK+5xDXptEVZDS1ghlQSVi8GXzKcoS1+WH5z18izIR4uvGu9LC
         ITHw==
X-Gm-Message-State: AOJu0YwIsWlB8Lt1ZLUQpDdgo8IeHuTDtqzgbYv6Iv87wWA7ei5sM/nF
	F4O6s8P9prrI4itmHTgzQwyL7aIo2i9ph27kXpcWOvSS2rMlFPdquzk3i6husJ3eyLrmze755Mn
	Pz+Syu3sPaDzSeS8ICjdxC6rzaSI=
X-Google-Smtp-Source: AGHT+IFo+epz/xlaGpcffIVXDILaNeuEvBRjLfXb8ou+lTeIvpXr2ucs/Hv26Fn0E+Y4Ej8h59GTbot/Xm3YoDvbccs=
X-Received: by 2002:a05:6512:3caa:b0:510:1b43:2baf with SMTP id
 h42-20020a0565123caa00b005101b432bafmr43763lfv.132.1706130008786; Wed, 24 Jan
 2024 13:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124172438.2086766-1-ckeepax@opensource.cirrus.com> <20240124172438.2086766-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124172438.2086766-3-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2024 22:59:32 +0200
Message-ID: <CAHp75VfxvZF5bRFuPjbxaWX0hNUoS3iPi5ctYJ-koD_B6N=iwQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: cs42l43: Use str_high_low
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linus.walleij@linaro.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 7:24=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

Commit message?

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko

