Return-Path: <linux-gpio+bounces-26005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3607B5441E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8703D584E18
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 07:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8D62D249C;
	Fri, 12 Sep 2025 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ou01/gYm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5122857F5
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663134; cv=none; b=J7J7Ke+muXxiLyQwv0FlRZfolPkhWfDT81c3dHNtOuta8d/Ao4+d/DgxARUG8CAS/wf2Xf3xaJ5pEQ4bfKacqVeYJBi3/0F/MQ6WUZfczsq6FHY1yEKr4BFVKNQlbPyXX54woTtxCdmHTopELIHEBH5oXeX/qYz07dAmQRI3WZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663134; c=relaxed/simple;
	bh=6FZzZpXKOXHzhJ2wnkOGqaqwmyZ8ymDmUm9n/R7xppU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/y2Apv07JDbLKOzhDh77rCNcs2jQZw2INVGe9IurTpaMYPQTmvJAoD/V8Yf9/XGODLnmfMrMphDar54p2JsOSYt2+HUpYLTMK18hiFZXERBjz0FvF5/m5hOv/01urM8oHMUdzQST9XKwVwn8KHCcbYtK5TSpzzeEE7GDiJLITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ou01/gYm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6f434c96so1689240e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757663131; x=1758267931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FZzZpXKOXHzhJ2wnkOGqaqwmyZ8ymDmUm9n/R7xppU=;
        b=ou01/gYmHWzmRqiHYqhf+HrV5cImsTJB6CuCDvjdCPRBFGWdlWsyYwKoFUiacRx5qP
         gnepZNDoq9grfoKdcfF934UjQu9o/nAC/SPg/NeCpQAD5nYiHbSbZ5co3xX62Y8Y/2nD
         RJJbFB13Ik4LFgjmE4UJYoaRxcRC7UFpfi4WgIckO62d1R66WiwlFEslMmub9jXojb+6
         XzLhbXC2ESDJwnQNom5cbdfCw8S9lEWv0KLnEKK32FCjTgi1zJ/y1/9JNly5UBxLNqZV
         PP8lb4Tzp1hWXoKXvjVu7l5Kv0pWdc0qZEx3sZ/zioQbOI0/Km9adp4KuwXATiJ05hWb
         9Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663131; x=1758267931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FZzZpXKOXHzhJ2wnkOGqaqwmyZ8ymDmUm9n/R7xppU=;
        b=r0sCXwL8RQHlhDZ2FDPkNlHXVUo3tf1y460EGbPGhLI7BeVGq3rO2bXft/b13wkixe
         80zavXQcXil+NVo3V7n/aKBcJa3P+0EwcWSFPDHUZvt9UIz7NEgmFhj3MxiwvRtCaXv0
         AMhg4tesrNBWEroVD7Z0I1vimID30UqIcTtr4vCz/Wmc68zqEwt/0TuUpShMEv/cK+5d
         GzuxfFuoFkQAntnetRvm4N/c1h2OcjUvI8HY9SRQ3c8eUSH1MEkaXNYaGSvo6jFCYPfy
         TuvH6meEm13Au5ake0aVwYm5SWyXuNVIK3J0vLRedeaazQsLl8LNTIaSI1j/NzD/WHvg
         bfww==
X-Forwarded-Encrypted: i=1; AJvYcCUDXZn+WlOuMVSoJpTrVv0uukn3lGOALeY9sGP47K9Zi2oAMe3tCZb0y7a6jsnQok0xciO1fQVSFwMe@vger.kernel.org
X-Gm-Message-State: AOJu0YykhAtlOx+EjMTq6rtFOcXLX7AGY9ebtCYMuW71IWJQKzHU/BF5
	z4OXoFiavjXfajsj5XttSg4dCpHWLJcNaKPgrocsu+ZTYVrHiTenTJCI0c+ttwCVlIlMtvnQZol
	swADfERmwTfQh1BmrFpdy+fYEwx11Jywdy98gvWkg9Q==
X-Gm-Gg: ASbGnctc7R/ZiittMsqstX14cFe4Ri9B3Mx9dsy/6BEhqwv87UOD1Fp0KhowZ1Wvl+5
	rKfgtNwd9mrYWysgeFAYcxTg2scY9OB/CCdcAqE2vS8m+wSYrEqDbICWSnjdWMn9QZaUmp8hJ5J
	t95JsNkPhyNfUANKeWubSTw2wlvhxoBKFKECVaefZuFZT8an6n7vHz04oVRJgSawxj48ekg1wL3
	AyE7T4=
X-Google-Smtp-Source: AGHT+IHlmRAHKqSdot79mnaN0SJhfcVcwXH1gxvx+jUHEDO9IZALMIrMYqfVCaNGxNsDXGYCgXZm+lDZA6bq0RfiLP8=
X-Received: by 2002:a05:651c:2359:20b0:336:c290:b321 with SMTP id
 38308e7fff4ca-3513a8f1a35mr3890011fa.13.1757663130915; Fri, 12 Sep 2025
 00:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
In-Reply-To: <20250912060650.2180691-1-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:45:19 +0200
X-Gm-Features: Ac12FXzUbHER-mkVUjmDr0R7CXpg398gO_vKvZUgNOQ1exRFoKJFGV6d7epl9gM
Message-ID: <CACRpkdbsJ75Th5=K65_teYXv34ECB9yx7hWeHG4QBao3wbCDvA@mail.gmail.com>
Subject: Re: [v2 0/3] Add pinctrl support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

On Fri, Sep 12, 2025 at 8:06=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> Patch 1: add Cix pinctrl driver to support pinmux and pinconfigs
> Patch 2: add Cix pinctrl nodes and header file
> Patch 3: add yaml doc
>
> Changes for v2:
> - restructure the pinctrl driver to support pinmux=3D<..>
> - redefine pinmux macros
> - move header file from dt-bindings to dts
> - fix the code-style issues

If you want help for managing the different revisions of a patch series,
you can use the "b4" tool, here is a tutorial:

https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-=
1

[Konstantin: the doc link on the bottom of the article is wrong
and needs to be augmented to point to latest!]

It's a bit tricky to switch to v3 since you already started without it,
but it can be done with

b4 prep --force-revision 3
(see full docs https://b4.docs.kernel.org/en/latest/ )


Yours,
Linus Walleij

