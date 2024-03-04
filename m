Return-Path: <linux-gpio+bounces-4117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE52870747
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 17:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD471C2140E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 16:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEC7481DE;
	Mon,  4 Mar 2024 16:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HhNdSJWE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36481E48B
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709570081; cv=none; b=s/yAvJe5ttwM0hhmK0HQPGiFVyVG9yeVVJPuupCbeFD5C/PoafgjEZ+AlANsWgst4Fje3Xvu66qOEhfQAi+aetgr7go5qjeg6xRLCWHNQCCbx0Kq5Z/DyTCH3V+kNaAiMJcwx0v21sO/WIRxnHWwy52rMNbEjhh2n2KqgnU18WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709570081; c=relaxed/simple;
	bh=A2zNd/rgYKnFeMBKCoWUuiwBLWEvwOAkTF2/8zWjdQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxgggMvYvLbPAfQW5rVmyeeRarSIDYOLOi4JuBDXB6udrxmtEuQyQ1KTOl5UqxCTrngFTYPs1D/Z22tDAmpYXmSMC6EFnbyLpih0TRV9+/YmL+/BgtNd4+AoVf6kyYM8okJlJnWyMnjI2b9FFZrCjOLnZSVcTjY3i8W8Vz8dVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HhNdSJWE; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4d331ba6078so837184e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Mar 2024 08:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709570078; x=1710174878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2zNd/rgYKnFeMBKCoWUuiwBLWEvwOAkTF2/8zWjdQ8=;
        b=HhNdSJWEiWSXAVtMjNkTyTZ+hfgEiI/SlCMEIOIS7ZyG6Rb90n+AN47rKOTUhY1bpj
         qAfLi+Vud2+q5ot1jxSgYE8KXEy08/anE/B/bjdgyYEe6sjOc7SOtt8Ufazek0nw0YY0
         9tPLbYVVT0PlWgOxN4iY+MBTu/+XIJ9AyOiDkSMRFvCCoZziXSkF0rGCFKlTHwFIsveY
         Emjl0MxhMaVM1auwGb0ozQPtp3bgXxCumC+hvD7ISSZOc6SjmyOUewkvmhIyzs1OCXx9
         2ROUNAE7Sk+DnUtAyTF/cX/POagZGnJZ5lQl1pbe7sRzYtBGB5FxpQOeSUqFgzI1lBk1
         yG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570078; x=1710174878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2zNd/rgYKnFeMBKCoWUuiwBLWEvwOAkTF2/8zWjdQ8=;
        b=IGfD3hYd/0bF6uKus372GcRpcQFlVUiVcEECqaWs6iVjEUMglnY/3z7US9k6VNWOZ3
         T3yJF2MRaeqxQu+puX/ArTNpcCqldJxTj79ktcN9ITT1pWRdYaNyMnyMr/0DC2tceFap
         zHG2Mprb7XUrGcnnNFTXSUDlPCAOD0e/raLVM6w202lLZ0zNhYjY3N7NdQ8abqFqrCVr
         3G6AHuRQoNUXh5ooU74mJGTljhZqWjecuTBLJx0VYY3jKF1Q9SZ2Cit4VFKUV+YgN/NJ
         lTaB3bj9BBArJ+X2OGX3NT042VpqZQYEOSOCUzhdOeQPag1gsAt0WzLKSoldDgy+RleJ
         3hhQ==
X-Forwarded-Encrypted: i=1; AJvYcCULgLsWv+PqBg8aHEf9IakeqOva/jauu/5kGerxmXWO9fFHhtqfKMtIH7k8tEO3s2LaVhyEhC8OhNQ/AMIaZAJSzEDAdpsOux8WQA==
X-Gm-Message-State: AOJu0Yz87RNCHQtuPpyng8sdP2hKPdq2bnwfYYONDw0rPl2tXW1/PXXv
	zmkMPPqW13dloHKHphdT3voe75aJvTTzwR6ov1neCW1xVbylArYxOkxS9UdS5wbuuP2vF2ZJZlP
	rlZdDWt4NFQahZ8c9XIZayt2wIGB9s4k2mwIid5VRRVCVoVagUALJCoip
X-Google-Smtp-Source: AGHT+IH6XCBv1powBU6LBfdOrzCrdX0z2XKGs7EqHW7M1CvYIuEzvlBS2CVQ/zEabk3lty6i91pid2y9iE8oMH4BO5E=
X-Received: by 2002:a05:6122:168f:b0:4d1:3fbc:db6f with SMTP id
 15-20020a056122168f00b004d13fbcdb6fmr6888602vkl.16.1709570078228; Mon, 04 Mar
 2024 08:34:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304160320.1054811-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240304160320.1054811-1-ckeepax@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Mar 2024 17:34:27 +0100
Message-ID: <CAMRc=MfAZC8yGXXYrCLeSxonOwozgxRdPC4h=aVgCMSkA7O_dA@mail.gmail.com>
Subject: Re: [PATCH] gpio: swnode: Don't use __free() on result of swnode_get_gpio_device()
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 5:03=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> swnode_get_gpio_device() can return an error pointer, however
> gpio_device_put() is not able to accept error values. Thus using
> __free() will result in dereferencing an invalid pointer.
>

Can you post the steps to reproduce this? Because it should work[1].

Bart

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/gpio/drive=
r.h#L616

