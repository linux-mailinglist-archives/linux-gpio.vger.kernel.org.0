Return-Path: <linux-gpio+bounces-15705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0AFA306B6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 10:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D0791888865
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 09:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DEE1F0E45;
	Tue, 11 Feb 2025 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FDIrcK87"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3C1E3DD8
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265366; cv=none; b=eip8cz9Ns25AlS4XfAqlIx+GjNMQfLqvIk/kKyMC6lbc9BZmTwYTDNvjutM+MwJzmHEZOAx2xRLb/aDhjDRZZu2HVlWVJOAMvPeB7O5dc63Qf0CJDJCyw1MiyfACLq1yKaaMsRenleyHn6U6o1Io3wlZHQCMrTFaGCmqytXeqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265366; c=relaxed/simple;
	bh=8UfEMiOEBOeaIBtwImceNCmamRpFFTjgv2GGzdM5I7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MK7UIs1yuXX6JfFumuvBaKLl0xS6GqZnbIUbH3prOgjhBiw9t54CdP9HkrsC8QXmnfgHGuBE7c2LNZElTNlgcAN2cJSsiU+BZZZM+CPdKmMo13qtjfBtFlfFUXlodSWikDgDPAhxOfKNcc2XvOFXNrqb6ObvyB8V5aZyG+1lVXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FDIrcK87; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-545097ff67cso2308569e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739265362; x=1739870162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UfEMiOEBOeaIBtwImceNCmamRpFFTjgv2GGzdM5I7s=;
        b=FDIrcK87hwYMj3ThVP/bpXvBTIwTIxc2CDQk1BsZHgA+tP1wTU0omUWu/JdUadLlpA
         E4prB+oV2f6vzyyU4eOb0rrIoj2Vp8MsO75xNE5zveAndNG0FNGkidoeuYtFBgExAnPb
         OOrP7R+ioGeslyZjvHUQ3+Ncf9dl3Wqcu1VYBZHiGWF1nPrPNqrwMDYkr6DxXqOAR2dm
         xcysla+vtHS1+M7ZKgQyTgUp67cIC1nEUSVEmM0pm54mecRjEuT1qyBPh4vJ0aLJdeMe
         DzKXCdB86OEIamIfNzv65JdBGTGyLZ6rwMEcwHDClXSmQZkLoh6HtYCDD3/lr/TQ2Yj1
         G8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265362; x=1739870162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UfEMiOEBOeaIBtwImceNCmamRpFFTjgv2GGzdM5I7s=;
        b=I0h9KpzEm5JY38qrP/+Y7ajwTYkXDxQ21Fqdgbn2KDhXrLiXYzlqMV0cBFPtUNn9St
         ynyMX+ACT//rER4M6ssWu8IBOgET25Zm5RWvRqz4rKCu4e1thM0yUW0XcZhHYx2krpt3
         4J2hbv5k6V5tV9d4tGUJlI6fNv7O7DgH6lBol7HJgd4X4N3C53Iqw2uum9Qvn9TeXsuB
         8NLl1WCQ8Fzmffsf4wop0MZonVVBJo4Qr9X02+5sYRuCbasqB8m47YRjUu6mJB1CB6dF
         Hq6OMayknyZuNvTDoYKo4WvUpVd1JJXWdaeqkC4QsdPl+6ZPg5pSAmQgsf5XaE8n7w1P
         Fcig==
X-Forwarded-Encrypted: i=1; AJvYcCWLCouV1Lzb8J0H7UcHfpZRcsdXvBhKZWCXgpJXfuflZgDsncwUuedN4OKm38qATePc3tjiuFSEUVVN@vger.kernel.org
X-Gm-Message-State: AOJu0YxidMGfmvAru5BZkgCtky1LmKGxcnInxUQ5SroXU+ubATDBu6WX
	XikcYkEoAqzvujXExz2Tvcr/+xpFsIsSki8d9u16XrZENaDke7Xh7RmQ3d7Q85w52jUvORRLUsI
	7u9TSS9tut34XWFKFYKlK1igpf3gEzimV2F2SWQ==
X-Gm-Gg: ASbGncvj4hNNrRwtXBAcHikIurD6Z6PA8/PjSViOBN5ziBssTizk3s5ZUI+UZ/tUT5x
	xQp6jVfGc4Gd4UUk3ncA6hc1po8ydNB44H7ohtmJeDgS6IKmvvKlLVrH1dNQ/WuG4F5iJ6/p+
X-Google-Smtp-Source: AGHT+IGUDw4T7meBLRLmxvDNfzzNRFxj3H+A9DNaY0nmeEagW6HROntcqR+BTGp7fazad8t23/Foxxtov8jsByu1Lis=
X-Received: by 2002:a05:6512:118f:b0:545:a1a:556f with SMTP id
 2adb3069b0e04-545118767edmr854568e87.50.1739265362482; Tue, 11 Feb 2025
 01:16:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Feb 2025 10:15:51 +0100
X-Gm-Features: AWEUYZmKsMFSUUUDA-6QujaPBWCv-A0WnPWsEIS9Ys7-p_cNmYjrYPDZOgguks4
Message-ID: <CACRpkdYgfpYAGaWdoULMhFgXRj49j5Jkf9Do+wmG=NiH83nSRg@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] gpio: 74x164: Switch to use dev_err_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Switch to use dev_err_probe() to simplify the error path and
> unify a message template.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

