Return-Path: <linux-gpio+bounces-25152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67482B3AA0F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 20:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0521BA7501
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 18:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EED9270575;
	Thu, 28 Aug 2025 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNeBrZ+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5DE153BE8
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756405848; cv=none; b=njRpIJse8AtmztYhqWK/hldeCYSkGGD9AkPpGqKhQzywGADsjc+bBfbnn5YiYP3M4TICULH1Q0HZe3aq93URHC8IMFyiV6LgN63yLJb8FBazPTeA9L6QT+gRUH8N+dKxKfpN5otkOxy/KD8E0Ac2zxHFM5BfJEezcGxNMvgHQNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756405848; c=relaxed/simple;
	bh=+cJ/42k0VYV0M2aXW9zlZKPdMXAl4MnJ7P2jUvIq4L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCHZBwMTiNd4auCdR9I6nBwo2B1fG4om1btPCDAA2BhZW3YjOyBIgPBaoR/8uTBm2iuBToIGWqqmnAlvVAYUdY7rrJ87a3yv3FeLHbNjrGiKm582a1nPC8kFuKO7tjcwhafHLyc9vK0Pnbkoh6Y/S3hlF6PZIpa+HoVlpKC6fcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNeBrZ+E; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f4345cfd3so1383847e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756405845; x=1757010645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuEqj8/T+xiUJS7ax+9xjCXIR39EG8IKnjSfY7eLrqE=;
        b=BNeBrZ+E38BjyjvupSb2gQHpE1SplDzA9594rrZVAFinmH6jndpyrOES7ZCYjEawX7
         Zu0Q+VE+9IdXeHMVLPrzvkbDzItx9IfMnAyP2IPlsOLU7HMiawzKS36nYt6dXjtbRZNo
         7xjwH7XnljcnSyxmb+MSrj4wJegCell3tik0YXHc+v2KiffxqsVvM1lSEye06j4wS6vy
         bDOdXZEF5uKfzfsC2q1hTZ46afGd+A25JzBmdbv+dl8D6dR+/5+k5c3e3lNdBrn5WOBb
         RLCjpTxvYXpM23xRSqmyhs0S8A2MVZyr1ZrA2S2bDx/aWlch9M3VRKTjNMchJcnIpS5T
         avQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756405845; x=1757010645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuEqj8/T+xiUJS7ax+9xjCXIR39EG8IKnjSfY7eLrqE=;
        b=FLxBU5ZImslJWKddeWJWV0zfebYRBx1uIAj57GaJOek9/kRKDbA5W/XWmCA1BB/IOe
         et8ZvBwZJnT+4J9F/7D89Xf3Ot8ZzqsWpwZwPYpc3/NPD0QnUUH8/layHQBzLwBIxVbo
         rRXwJa3N1xTPmSdLc2+CD1ASZcT9rA//DrPCAz/ahySZd4wKh3PVzpnif6O/8d8zP1r1
         vepZ8vsIJTYtckr+QEK5nJ2scvUr6dZB7g0rBM9ADIa5k5j3+vLT9RR9nlgv0gGQjNe8
         sDfc4r2bykDtm7OXKowr7QbcK4k1kr9dNHUXdE0z1DNDAWMVP2/1Bjf61S590jwRTNhO
         DsHA==
X-Forwarded-Encrypted: i=1; AJvYcCXauNC/66HreE3WtyV74WRZ9ak0cG39P1UrGoOshE+hNNYn9ce9mKpiP3uG6ClNtx6svol2PmN4xhik@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuABssocV5qUh8BGXXeAzQHL9ehcijudZb+y5w3l3KBO9akRh
	zwdWglcM+J0+fZGRMLc75BymnSLN9KlinNQoKtTG8xRvvBogP6NkE87Z0A+vSUyo254XhOWzxvI
	pr1Yihc1AcNVvun6nZMcShvwv3UF2lZX1SXujw27wg9jlEHTS9qGC
X-Gm-Gg: ASbGncvDB4ysCZStYMxtQ98Bw+m2v+glaZDKLX7IbJDQZQbvYGHB+R3DJPsrd+l6wP6
	ZqJ3HfNaCNMIOgkYRCRTQHFMaoIsVjvdJJ1YOXMUni6GGPA3dho0Czv8CVWwpY/MrOLkzkzZ/Qk
	dHZM61b7jJVX3YJg0g/WSsu5oMYbCCmyzlnBD85xNlrmzICLg/ECkiRbdEQOMNhg0gLpcc/eVZN
	L718YQfob4AeR/Ntw==
X-Google-Smtp-Source: AGHT+IH/8kZJERm22+qgVkI/2abRlg7jFqSaoz19NfilAs8gqvm1/HMq3/qWcpNYFOG6zrPS0q3FvE7sFdLPB8sog2w=
X-Received: by 2002:a05:6512:2c0f:b0:55f:3f0c:e267 with SMTP id
 2adb3069b0e04-55f4f4c66f2mr2837563e87.17.1756405844595; Thu, 28 Aug 2025
 11:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827074525.685863-1-alex.t.tran@gmail.com>
In-Reply-To: <20250827074525.685863-1-alex.t.tran@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 20:30:33 +0200
X-Gm-Features: Ac12FXzu3BqzQAEjjUx4V_NHl1QbSsY2Iqe-wW7HgjaVEzgtXC011QXplgETcSQ
Message-ID: <CACRpkdbct3o-=-hy97OMg1O+E_Tw8cNzRTa_kh0WB2LxJrHwJw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: driver-api pinctrl cleanup
To: Alex Tran <alex.t.tran@gmail.com>
Cc: corbet@lwn.net, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 9:45=E2=80=AFAM Alex Tran <alex.t.tran@gmail.com> w=
rote:

> changelog:
> v2

I think Jonathan will trim these two lines when applying...

> Replace FIXME comments in the pinctrl documentation example with
> proper cleanup code:
> - Add devm_pinctrl_put() calls in error paths
>   (pinctrl_lookup_state, pinctrl_select_state)
>   after successful devm_pinctrl_get()
> - Set foo->p to NULL when devm_pinctrl_get() fails
> - Add ret variable for cleaner error handling
> - provides proper example of pinctrl resource management on failure
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>

... but it looks good otherwise!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

