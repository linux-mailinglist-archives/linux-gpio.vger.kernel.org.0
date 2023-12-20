Return-Path: <linux-gpio+bounces-1717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE18F819EA0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 13:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99E742854D9
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F9E22093;
	Wed, 20 Dec 2023 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vm1OSJQj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6936121A1B
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5d226f51f71so48355227b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 04:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703073883; x=1703678683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMvBtkJOzmGSVbJH/QzxKrcqb7XE21bT4TzYOYIYJhQ=;
        b=vm1OSJQjZDXpcPLt4VHExH1hC9J/ri/owObr1+R5korlRIpew81Bm7bNoe2F9nO08D
         hUl8V2RWw4xEzb64x2rK8VyGuiCA98CYbh39YQemAvnM4EIUDeeW4VFljUTKR6KEehyQ
         feEoGNzMPcGlerFx6j3cxDMGSHSGs6RXoGjNpCMHhAGLnkLgdrIMHVBg/cpbrY93b1xz
         Ny96GgWNNpDgoriH8hOBzHqxsEBZIHb1HSwfhzYaBehzz0QHRwznGZDPNvVVeJE4eE4N
         NeQf0remfBkUfIo9e8sGqkq1kZAwuaPRrfJVawSkmSVC24aKMOG0Pgex6CSfyeEHi8zU
         BfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703073883; x=1703678683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMvBtkJOzmGSVbJH/QzxKrcqb7XE21bT4TzYOYIYJhQ=;
        b=Q+lmOZNqLWT+1SSSTYB1KVViaR1KqzvwbvBEQPHCo9ZIy5d0OeKDtPqnep3nV1qpwH
         V0I9HPgo9Lt+fowRfjJTM7pEhURKe2ybpcist7i2+sWaaU4O+k7OsE4rSpXqKCyUo/W9
         1BlQhYMKK7IxUNn7bfmFH4C+BzXGLEZXXDi6iiN/AWhgNH+gRMTkhmjehMNsaoAJ3bb5
         ul15ayNxi/GLRLM6HCzqo1KCKdacSb9dYVyIeMkZvUD4rhm+S719YOkmg8Z93l5mxu+W
         90JkkezQx09O2uHU9qm1L7vU4YvmRHaT0yb5As1PHJu6Ywf5wxBY1Qm3UGJaYFhrv/B+
         e04Q==
X-Gm-Message-State: AOJu0YxIrB41Rs+/gQM0K0onWU42srSClKUm3Yt4yYcDpbIcDuIkVAIi
	16Cd8xIH5n3+7MpmKsIibdy/95Rw+tRnCdVikfazfw==
X-Google-Smtp-Source: AGHT+IE1Au9g78+ML6Kh/HfxITrKCRM5PguQjY767jicoguLECNwPzDcWCBH80yERtMeUIkMFe94tr8G0pzaH3Us4is=
X-Received: by 2002:a81:bd4a:0:b0:5e1:6f7e:2806 with SMTP id
 n10-20020a81bd4a000000b005e16f7e2806mr12852200ywk.45.1703073882931; Wed, 20
 Dec 2023 04:04:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
In-Reply-To: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 13:04:32 +0100
Message-ID: <CACRpkdbH9NvYr=mW70qUXZT9ePKSktdKJg7kLVRncpJoThqrLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: naresh.solanki@9elements.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 1:53=E2=80=AFPM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Currently the port specific registers behind the PORTSEL mux aren't
> cached in the regmap and thus the typical setup time for a single pin
> on cy8c9560 is about 200msec on our system. The hotspot is the IRQ
> (un)masking, which causes lots of R/W operations.
>
> Introduce a separate regmap for muxed registers and helper functions
> to use the newly introduced regmap for muxed register access under
> the i2c lock.
>
> With the new cache in place the typical pin setup time is reduced to
> 20msec, making it about 10 times faster. As a side effect the system
> boot time is also reduced by 50%.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Patch applied for v6.8.

Yours,
Linus Walleij

