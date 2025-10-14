Return-Path: <linux-gpio+bounces-27068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1344BD8C36
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1130D19223F5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 10:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D2A2F7471;
	Tue, 14 Oct 2025 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVA9EFLq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D332EAB60
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437636; cv=none; b=iKnxg6RnQEwIE6jZP0K3wQ4OACDG53UHJDh6bexVgs+8KJZt+z74rYPquqZn9yJ8NTQIYIuXdb3oR9zHeDLFMbg23wwR1fDjVUjMqTH99+Zhm+lY1C9PKzXkyQV9w1ESUKsPFdECEuP8ldhcbF9KS/VGjJ7/N88Sw+PGQCPiVRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437636; c=relaxed/simple;
	bh=FuJsik7+DaCaes12yTPDuIvuNgtexRYCMaqyKI8Uvik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ve5ayPK6QKgVQ9PrSXnXG29f6u/SXLZ3778y7dNL3yBWw/DPbzDK35hTQLnXZ+TezQPwizSbQLX08Ntb/XPt7Ke5HJ4tWVavqTzIvhVcVz3POT7YAX6voixavcHIHe24kc/W6w40luXIqp5T26iEvDkc78uC+z477O9ScT03E3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jVA9EFLq; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63bc1aeb427so5239219d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760437633; x=1761042433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuJsik7+DaCaes12yTPDuIvuNgtexRYCMaqyKI8Uvik=;
        b=jVA9EFLqLylN+My41k3vukyz7b4vyEyKBghyjfDP1XGWv7FwHNrprsXYottmnY6L9b
         /sMDe0gkqBBfaUQDg0wjaBmu1Dywh9uq+w+kEJw8S71SlStshBt2SaKZAupoiNHi9z/i
         SAav+knsbGy92kn3K/O9kzglii8SaDIhb6VFy8kLZLHRY9DVWR69q36wrJNjO0lqIzdR
         rDyMIod8KPVgnmRXHrwu566bdjUQ8JKqChGMaaiFIBDQKo4hOsKsdwDEEXVz/9+i26zp
         3swLe1lsjJp6pYzMRyrzDDX58SBwcoyjezmuuhfpW7PTI5rUEJ7yA78VNJkh2WtJ5XUR
         F5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437633; x=1761042433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuJsik7+DaCaes12yTPDuIvuNgtexRYCMaqyKI8Uvik=;
        b=OwVsnp+ehipyIh74ZririAiY5XSInflWPveH/DhLNY9rAaTCFTka8uXbL7jsbqBESW
         7mHgkyi8Didlee0+A5lcvkXh/iYJ3mDuLPzH5snktwvfaK9+WjPs2+AUU+HbF/pn+hmA
         i1MR/thZS76wisl3mtIDdLeUsgYv5iYyqJPVO3G6tiUFnXrU5+k5bC+1LnUlR4kDPOW1
         757WbmtDaSST6/LVHIAJEjnZ3aA4fG6mfwYEpaiPN3FYz9ZeURuhZJS7fJS9WNLu9py7
         in9NM5x0Dase5aj5gFbDjAQGMsGTzgmDpWWQ+2OLQpk6kUGKRK98CSjnmVy1+Hj9fPzI
         XqVw==
X-Forwarded-Encrypted: i=1; AJvYcCUW83ck0wFCg8RpekOmE6EjAEZeot5zfmgYxXsOYSp1xlLVw4bldPxuPWK/e1oCArgARPY1QaY6b0F1@vger.kernel.org
X-Gm-Message-State: AOJu0YyO5aZKL8ED0FmGqhByNLilYKSk105Sh+JAOs7c0EunqBu1gw0S
	YMIMyl6WgIMmL4kYkoYmz8iPZ+z/0QVQv64wXpFEkyc0RaHK6dSM2u+b2Z6fx1ymupEY7LgB5G4
	w39I2Bc91aws8Aba5EIGG4n0c384HxNPMoUPGTw3HTA==
X-Gm-Gg: ASbGncsGVsrVXi95IKz3Nk7vRv06xFMMPPfwbNRMeU6AuJiMFKERS8nZkOqtimpshEm
	IDfgl02ij2aZmg8HkbpM01gTIYJUmMcxRBJod8OpqcH6sAGNI0CP0JDktQR/v79pX6B9Cg/RoKe
	HJ/9qHP5cClo1Bu5RzsbPUuz+O4KWfzQEHbokES+DimTp3M+WuiKykT7m6ViqURP42oiZAE/Z98
	1nqob/cJKC7WaTQHxUem5eW58iRg9ZZ5BTuFZ4N
X-Google-Smtp-Source: AGHT+IHRa7bXy75d6i5HUlj+9IP+1DUMfQrZzPZg6R5BkfVxXhAtjPDhZHETMjFkN6BqO4iP3O0kBA7vwFOQ0olQU/k=
X-Received: by 2002:a53:bacd:0:b0:63c:f5a7:410 with SMTP id
 956f58d0204a3-63cf5a70a0cmr7264391d50.68.1760437633382; Tue, 14 Oct 2025
 03:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud> <20250926-unshackle-jury-79f701f97e94@spud>
 <CACRpkdZ5RCcaNJB_3ufAgpDtdJBKfOVrMbJVAQWaVSOkY0-XNQ@mail.gmail.com>
 <CACRpkdZo=c0BnSLm=FKRMNYKEaPAHBgtfhD9txhPofts4ApDkw@mail.gmail.com>
 <20251001-backless-cattle-a98db634d7f0@spud> <CACRpkdaEsa5gSpGxWG8xudMePt12nZaZRCRrW5Bf5JQ0f1K9Zw@mail.gmail.com>
 <20251013-spoiling-halogen-4e56c4bc83dd@spud>
In-Reply-To: <20251013-spoiling-halogen-4e56c4bc83dd@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:27:00 +0200
X-Gm-Features: AS18NWDCJqq6gcxVuwM3A6vHvRI5wTTMGMwzTKaykc-ECTJ_Ys6bz0-AI8XqdpM
Message-ID: <CACRpkdaPJuRUdQDWY+o91YEvh1Kmt8TTeBzjOoLYeAef92MGkQ@mail.gmail.com>
Subject: Re: [RFC 3/5] pinctrl: add polarfire soc iomux0 pinmux driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 1:42=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> I'll send my v2 on tomorrow probably, and we can talk about what exact
> changes should be made there?

Sounds like a deal, I try to go with the IETF motto "rough consensus and
running code" when it comes to pin control.

Yours,
Linus Walleij

