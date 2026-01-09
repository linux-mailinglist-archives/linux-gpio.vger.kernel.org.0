Return-Path: <linux-gpio+bounces-30356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A2D0AA3E
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 890D53041CE5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC0E22A4D6;
	Fri,  9 Jan 2026 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7XqGo4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF6219EB
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969082; cv=none; b=sArbLP2xoebZ90HFl/zL0XrhLNDgWnZP+QV+SIN9fsOqvbFSg+IzQKv1TEsvzW/L2H8+Q1ElKRATnDRyJ/HUpOuoLRX82txSAxU7Zj/u45UvXIoE3vPzFxUGIkMlSm7RYP1ReuBKLbLctOC8Zh6zrUmmwIZsID7WfwBHL/Ss4jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969082; c=relaxed/simple;
	bh=01eSsaMe1JTdiib0RCvkDpLW0jnmdXOO2xJEGYZgE2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuDpGy58/5/RF28jq6g/G3JZFC+60ug2YUGOd/1jX3Z3ShlPAY3FLGoWY7As6aLX5b+yKugxxQSB6dpvTiwRE4zumBUx/bPhX++dW79D5uCcLpg89zn6vtubTDIIpCDdsCpzP0goTCpeWQPeDpl5Cvv9yALetm9ayFHHv5x+RSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7XqGo4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFD6C19424
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969080;
	bh=01eSsaMe1JTdiib0RCvkDpLW0jnmdXOO2xJEGYZgE2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I7XqGo4f04YJ/Rj7Plm6hvVwtHkZ53H11oksTpHXaqzu0x8oX3q6LWMeE7kbI2tMm
	 TKBAvEBRozKy9waIKYqrugmlQ3nfuVjuGllOA/LewmWgYlngrxyy+hD4KmeO8BPMDP
	 NvT8SQCTC4VqrsYed3+f84AU6XoQd7Qj+2LzVbULnN56v8iZuRrMICP32wRzhAoRrE
	 CBf/YR01prUiIlB07kS8WMW38x6SlvCLfZZzrNlFxihS4AF80yT9n1pqKmmqbWsK7T
	 023ouJixpp2Xx9q8zGH0bs6eBLIKWbLOVNPSA1ZJKgXcjNdvONsF+wl5+0on8xDw0V
	 eEWwuGEnhP4lQ==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-644715aad1aso3804139d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 06:31:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbvMQbcetzeizxtunvxJcKr7gzBaVOkuCDHsz+8XbpvOF9f3vJ3n0zZaydVpqexUyTIO3dt2M8tO2c@vger.kernel.org
X-Gm-Message-State: AOJu0YwsP+mI6UCySdUlOlgAM3TyVkHeVkGWtkaMsunnrj0lJgNOyyFU
	Mm2Ie7YIf94HsM7H923qg4lCSA4DE+hWC6aO/zK/dCdky2C2IPKWqfKGXEVUZASdzxSLuS6V77O
	UXyR7uocGxKv+TgkPMTUxVIwQy2Ou2y8=
X-Google-Smtp-Source: AGHT+IFhAlxTbdaA//Fhy2sAhfwB38V9H4iMQ0QNiYytcQ6JHM9UcPFOWVtAZmdsQJ9zUbG7MiqLMZNEkkWZCwp0lBo=
X-Received: by 2002:a05:690e:b85:b0:641:f5bc:692e with SMTP id
 956f58d0204a3-6470d2f4d8emr9469904d50.39.1767969079084; Fri, 09 Jan 2026
 06:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109130003.25429-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260109130003.25429-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 15:31:08 +0100
X-Gmail-Original-Message-ID: <CAD++jLmvgyeJkpqmuVEn3-F77eHkaa+O3s4Xh15B22kSgWMQPg@mail.gmail.com>
X-Gm-Features: AZwV_Qhv4a5OCcG4wkx_MtJb6gxs-MHdPTlhVorZm9clfY9E09RziKd95XcNEis
Message-ID: <CAD++jLmvgyeJkpqmuVEn3-F77eHkaa+O3s4Xh15B22kSgWMQPg@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: implement .get_direction()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:00=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even for fixed-direction controllers.
>
> GPIO core will even emit a warning if the callback is missing, when
> users try to read the direction of a pin.
>
> Implement .get_direction() for gpio-davinci.
>
> Reported-by: Michael Walle <mwalle@kernel.org>
> Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org=
/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

