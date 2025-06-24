Return-Path: <linux-gpio+bounces-22083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFABDAE6F38
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40AF617EBAB
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2D129ACC4;
	Tue, 24 Jun 2025 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjcTzL41"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8272459C6
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792200; cv=none; b=AoKwFfssjGV6iMp+S/yCAhUh7I0tEMkG4GGHwbzmJV7aizwO1YJMDQ7Shd3h+hZ7vWRbL/OzlGKvir8ir84rq6vKN478dANeMw0iwpTi7ZfZ41NX2Os8j9JNAFKoCe0qauzlMdQTJbGWzVCb9KmsC5FCAhMyjHa/1I0YnfXtzr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792200; c=relaxed/simple;
	bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMrQKHEAgM9FJwZ7ksG6IBjqw1Xl6mHZJO5uiGAQsAdhBU6Kdtri19jmPHB68IT4hks0Uu77rkcrWU17J7/dzDyjNNM3iOYlzo5QHnSRfm6Q3W8W8riI3tqMn4uABZzJo25WYxTMBU/0vxPH15LseixtVMiy6L31W1CPNztW6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjcTzL41; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b910593edso7100431fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792197; x=1751396997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=ZjcTzL41jB/kZUDeGngOmfr8licR23+YP+SfM3Ys+9kcbEEP6bc2tIjj+s6116mnmU
         RuDni2ms8BfQWXYh6dftypJB1I+IQqRs+x/KSVFaEe1OMt1Stmaefr0U53JT10HdA80n
         uGIMoJew8TEQ/GGvEOnmE34ZUsYKd20dbQDCQehcpqDrDx5gec4hyUNyELwBb54yVIHf
         CtOJtdHax65go4A9Iq5I39SMIG/WJQ8ycHbYBxg0/yakDw6WevKP48ZHE6VI5udjlTGz
         mm71jxAMk0Ag74PY1wlTUTsVzXxEd6QtPF2978R1o8G6CDSBHCm4tbpVDh+v7ni9Mqsg
         R5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792197; x=1751396997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=oqhJx6NBiUuWKfkild4zCAIqJ2k8ikfdChGcsRWVypP+KE4Vd0YSNzpGnJMhjNLPvz
         Q3yBv2X2UQWVcwNwjsAMpV0/oC24qpCIYT+YAF6WCXdeSQeaaW355MXoJWi3x16CIqKQ
         3EFTg91fHAo70Vn4ZA1F4v8ThV7kU3alVT7O8DHiyCdPKSlTvmZsNVcaUU53bhv6qPDb
         g3o66NX03MXdA0uYKNvnsCofUBY9AgeWGMU07XXhZYP5sozy5QiR9V1kwGMJ4vOKkxXh
         zwZg749XXo7mheiSVzsAtoqbLPcw4/vAt+o//KrwmWKghCZGQf9QnY83SUOV2k/yKOok
         8IaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqyQtXHn1O92t6KB2rDT9xaxReCbrzJlfbRtO2dAmcAWP57C1zie2RCFb3mrRt1Q+hTe8RuObQQWgW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiy+RUp+4/KVD4s0ATIYzlRYwkPfUWkpCjXE+sPPG5wgAh37AK
	ziPMaPDyEyzFnrG9gWWOz5ArOQIPK4a0RnbNj66K50SB9FJud9OhJQvvR5NYFMJySkM6ZSHRbC6
	+UXNbjhXJwW1KbM7J+YQcbT5684pW8IrNRn/8nZLTRA==
X-Gm-Gg: ASbGncuSJ0KO3hAIu67EMhchKZ11UUDP0gcX+Yxd7fGmipjlsAHEWylQnjM7hEZFmlM
	qgo/Cb0nQy8SgNNrzp8nfyRkAAOcrGpzoYfASH6z8+jvFXc0IonUp11NkQBB8L3BNHmUda2rX00
	JdOaF6jYJi4pQPXOhAeLH7rsDxN1GksCacp/4abNF/EG4=
X-Google-Smtp-Source: AGHT+IFYV5tWfAirZ3xGznpIUaLpWBixuh3VvEydLIyjUMUfbNZ+cH8IGpZnstfzUOBltBpSOosISbHrdrVWXJsPv9I=
X-Received: by 2002:a05:651c:4181:b0:32b:8e4a:5710 with SMTP id
 38308e7fff4ca-32b9906d535mr47675041fa.34.1750792197208; Tue, 24 Jun 2025
 12:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:09:46 +0200
X-Gm-Features: AX0GCFugxTy5C8vSywb43SRY5CIYHYmTk1VMWuSas72eq14vY73ndiufDbScINw
Message-ID: <CACRpkdac0sg82LFV-Ub1Wnbpq2jTWgAVXZzCdTqLakV_4GkFbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK registers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 1:18=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 =
to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it ha=
s
> 3 EINT_WAKEUP_MASK registers

Looks all right to me, I expect Krzysztof to review and queue this and
send to me as a pull request.

Yours,
Linus Walleij

