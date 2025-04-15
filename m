Return-Path: <linux-gpio+bounces-18826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9DA896BE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA563B5A25
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379A527FD66;
	Tue, 15 Apr 2025 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVB4REjZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFCA27B4EF
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705861; cv=none; b=CZh2dSGfAEvw8bWkfcPgI6wfjB95PHwX6DZn8cndTdzph7Kq/S8hbv3VTo/hYYd60zfRX5yEQxQ/eFsugBNr1oBV2VAdnDfXs+ZE5iB69nTgvgW96MMRpf547kilNS5kY6cYZjKLAXGWA/c52a7+AfKewZMtb4VmEWLdvsufNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705861; c=relaxed/simple;
	bh=7FMR4vK7CkGM3l4LtzpFaWNe/WG6upyNAAMbvvMmdJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WroeIDwqsIklxpOhsYfUQzTEHYE4MS9oKoOYWP5qlx+NoDQK9niYIzcacAVQlF5nN3oaz65/kBUMHmu+ZO61mJSGqWk6HkHNrUW1PNVlQC2AYWIIX7MwqAhK0x0pbWsN0gcWy8POkflBG8Vx5EZS0JihwNOhmYXEdXwh/g63MGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVB4REjZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5497590ffbbso5542873e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705858; x=1745310658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FMR4vK7CkGM3l4LtzpFaWNe/WG6upyNAAMbvvMmdJU=;
        b=DVB4REjZhro4kEG4VqMryl27liadrsNjzwAcPgzkM860OmRDlOxd+nHLAsVUT5gT+G
         te/t5aLLPUPwIRmdNkiOd1lZL38YPQui9kk7jMfuMu/iBvIhrHZKrI1sFjDjy5/DsXil
         TL5uH1KiFPXKOS7cFBZX9MXCbmGkM31L32gVrUPCwDoyiysmfYzVGG9Xh8a2twujwt/p
         qZU1ATkcil24bV5Vl1U/3fExjNB3cLDV2gw7d+9HRk8MgdjN8IPDNnsuO1xMszfHaufK
         HIIo2wdLPlHw1vD+51uGlR1TETW0QHDyVO+ZMr1Dvj+vCNf51UzxLuDYN2FIBWlt+PE8
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705858; x=1745310658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FMR4vK7CkGM3l4LtzpFaWNe/WG6upyNAAMbvvMmdJU=;
        b=KvFjXeeh/h9aAx2bDHVpwn3V+RFR66sUp5Ug4SX5OjNaPQqV3FCY/YRFKd7D1dKvmr
         G8bIA95vIJmFvv+xjdLBQr73jvpyRPO/IUUvhTa/M9gmNXJfpdIynR9yAQdVBpcLul10
         UVXo8u0Ah+GH64q0+7J/qs5E2bRH9zSBzaAadI3ae+vCOvwArY+KU46fnH1yoAROCS09
         KUux7ilgZL0hCpfBo0QQUufS3mWmroYWOPhnIzcR+yKzXwYiqgCHarUNlo7jdpDS12mz
         Ko4G2DJVqqQvwwlzSxo2WWd20WjwWAvG0RFIpIutEA+vAsvywP08iVaE+QMKKVUWo5F+
         W1SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSd8mRy09zVO3hu3wGK2beA+TpKEVaO9F3qTwOcoXdMrlpTWtwrU88mq3Bi+ZUGfG5O6TSA3Nrk1ec@vger.kernel.org
X-Gm-Message-State: AOJu0YyzS7WHzzMwlHpdmp56Cm7g+0x2FiT+D1e3iqCY7xAmxrXiXZDv
	Zu6KTSWhpkGMLHvr0IROLPvgIu4QKDuZv05eXVi/p9DyCRX6PJS2pdxbO8+h39QrUbqry6BSgNG
	ZlDzJYpVX8ZI2V9RsqbqZiyH1O+45wNQapUDuXg==
X-Gm-Gg: ASbGncvoKbcBB/Cm/DC8xmr682GgtBaK8lobRRCIy0kzuSs9+B7SOjFEvRTg2PDoQpI
	r+UNzb8Lex/wVrntSSDALzGRTgQy9bJBMiCw/hOgAv8VSz5n19ImmkC9LrzTKLwdusbMahcYBNU
	MjxGOK1Q0vybMU2NUFIYtBmQ==
X-Google-Smtp-Source: AGHT+IGnEYdC/tbXp6zUzoQmRqryQKEflVM5MqJd7M1yWtqEwMnlg/Eex3aKuiEz7JOwodkSWTklDUqq0ZZR8bJmqxg=
X-Received: by 2002:a2e:a545:0:b0:30b:a92e:8b42 with SMTP id
 38308e7fff4ca-31049a930d6mr47194111fa.26.1744705858086; Tue, 15 Apr 2025
 01:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-11-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-11-78399683ca38@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:30:47 +0200
X-Gm-Features: ATxdqUGWGRkCpITOv-VvtHky0F7dBdnGGWgz8_h-UuiVgFohkRnQE4Ctw9GFm-8
Message-ID: <CACRpkdZKH6SaW3LEjTXgkoewH=E+Y0O9x0mJ9sVutb7QjyTS5Q@mail.gmail.com>
Subject: Re: [PATCH 11/12] gpio: ich: enable building with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing to build the module with
> COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

