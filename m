Return-Path: <linux-gpio+bounces-29164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFCEC8F76B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 17:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D0D03350F0B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 16:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA68334698;
	Thu, 27 Nov 2025 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILUboCil"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473F26281
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259989; cv=none; b=r3qmmaXGN3ipYOIPowmdliX3X+UPTc7GYLXAheCBrpRTDI9jjjC64UXixwRuu+nrpMUir3XOsOOlKF3e+el6FCiLJJQ4oUqDcIzzvrA8qXk08GJr82PSz2REqPoXwvHk3wcfET8/wEKtMq8KYyfWBFOWbXaJ7VfrRFR2RgiAUXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259989; c=relaxed/simple;
	bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIm30kbFyrrHYCBVNzeFh9oP4LMCagi8/LkXVJ1Pn97A7Az5n7WM1JNk6MggeEi5vDRE9BsNPlZPxzQ3yzCq1rh6ehuTZIsekdeBPuAWuVuAzPwkBBUVNwWgXDMJQE9LdLHLPhBFOFw6I0gQsf6BkZ1EHRnJe3UCfIbzl7hoB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILUboCil; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7380f66a8bso162765766b.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 08:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259986; x=1764864786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
        b=ILUboCilhRu7W2l5uL+twL13aTtqP0MhjgKRRx2EMIflWnKm2tTIgbXCp9YjNKx4uu
         UsKxTeNgyxoxqMXz3Cf64Of7brK0+IiX8CjgvisY2mcFDpRTG2JO2Le9mJDH3klbrY5N
         C/OCOysbYHIDDRPNHlyvUxA0eu+ypLJ3qSI0cw3KEbK3SzDI9oRyX9AvAq4QGNRy+d0K
         A1XUYALNm8gGVaBIqY93OILPgJ06q2xrQDn/ZR5NDnlmBPM2gk+t8BFZQI3+vNP+GF+B
         LdNWFf+5jS1NyT8YJ4G6rJmQd1u6PAQeU5jrjouOzp+aQCxDSNr8Q9J9Nj42mPRCY+rn
         HFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259986; x=1764864786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
        b=m6XgGh3STj3u9wqpjUITMds37YvI5i/Sdvq3vp6eyC5qJypkDVruIBzclkcpD9r/KO
         hOKtqjhSNt6Ug2NyrWfo1l4w+JY8rnECuE1iqSpBoHQLrA7xYj6hXIrmeia81g+dI2KW
         MWveoJkQSBPeYE+enykhsE1Mbjz+rF4MZjuyezp2pquZ7GmzaEM9c9KUk88vNHTKS8GT
         urm5z9mloZzCsl25n+HKX/j8tk070H9/3ZQc6+x/myTzBqOgFITPRE/Ycly2JcKZ5knT
         W+dtciY98Baq4dCWyeaDVUfUfsuy4LsUTRR6w/xhyvlOoP9rJz2fT7AsDuCT02ZMx1y4
         mN3g==
X-Forwarded-Encrypted: i=1; AJvYcCWxMxKQBnXB56qcTrZ8NY51PkG0sLysYSuUVgDyVoYqruuIUusjf+rxpWN05uf4NXAE1zME70CNRx17@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aLPp9oTxTDdRWlEbiGokKtyL98k5zHsiXhxDnnNgVjb9bJm3
	dDv49FHZpjQofZzrx2DY/XBIe+1i1f5wpip3muvUCz3jSnc89Avij1b4W8ke/UKnHR7kjgwUBcs
	2KusmSLTJaijCVHQOeuvMUOScZsG6HJw=
X-Gm-Gg: ASbGncuVzOSBvClvCWqKm5rPKKuqBMr43q/93bu03hjvmns1slnbPr9HTbruIGiTiWD
	tz1m36/28eQYIkNn+4sR7KhXK0Ohn14h8Jm+w0NiR/a6VDsEPP08Cx7D8ZK2xcez+pye0HDaQMJ
	6J5xJrecWsXU/3//0qdCZKMl+Gnf4kfgpmD/JEUyhXkjqFRnwlueL1eRqZ6idfRv3aaeOgcJZsE
	noaViU6y2cSvoreYnKs3/qmP+EnKicvcgPdtuQYWqHSoCucP8xwh7F/aoGzV6ZM7+tRv35s60xl
	l0o2WPykdBOCDgdC3w9pyWC45eMjPxhKPCJVgrDS7QOR6sFzISISJAfIHknuflqrUhiGLnY=
X-Google-Smtp-Source: AGHT+IHL5lD9l+Hh164xtP764PC1ElejfIHOpAawihP6o7z5n7+TtXrvPC3UUFXr2PXT/YoRMV/DR5xhbgT7VKwIfhk=
X-Received: by 2002:a17:907:d05:b0:b73:7ca6:220d with SMTP id
 a640c23a62f3a-b7671a4728bmr2613030766b.59.1764259985521; Thu, 27 Nov 2025
 08:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com> <20251127155452.42660-3-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251127155452.42660-3-dev-josejavier.rodriguez@duagon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Nov 2025 18:12:29 +0200
X-Gm-Features: AWmQ_bl-vjVNPE1-lBZUlM8SQoQAsmh5XSIjD1Lm2LJMWJiupqb_fmgKaxReBWs
Message-ID: <CAHp75VfhM5GuYY1qUKgBhePDo4oe5k3K1ZDTPbYJNr5NtjVVfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mcb: Remove MODULE_ALIAS from all mcb client drivers
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linus.walleij@linaro.org, brgl@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, morbidrsa@gmail.com, 
	jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org, 
	nsc@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 5:56=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> MODULE_ALIAS information is no longer needed as now all mcb client
> drivers are reporting such information through MODULE_DEVICE_TABLE.

While this is not a big change, I still would recommend to split on
per-driver basis, and with pushing the first one as kinda a fix after
v6.19-rc1 (to v6.19-rcX) allows other maintainers to apply the rest on
driver-basis. This helps everybody I assume.


--=20
With Best Regards,
Andy Shevchenko

