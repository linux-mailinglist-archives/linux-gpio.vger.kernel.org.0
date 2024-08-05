Return-Path: <linux-gpio+bounces-8570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11048947605
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05422826F8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E41C149C58;
	Mon,  5 Aug 2024 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evBW52dh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22A1494D4
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722842793; cv=none; b=XwUp6/APxOsbiEP/xGsj/sjbCzX7YJ4u1T0ScnQwa6g9rvmRPynT3P4RBvX6zJc4wuFPg1BLi3glF5Ud/o/lir+c3Y2Zbk7iLSurFC8DtgPLhhkmuqYHUaQbcCU6t0FYciMopdGNkR3MyAP5eVhSBfvrXCp6COiQjD3wznxCyTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722842793; c=relaxed/simple;
	bh=WO7Wk3TJ7iWuEM+gkEw6o+cg523KxLczIFJk+pJnpBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p08Eys5Yzv61MgYDuBFE9tZ/DprwkB8qajjfV+LIf7Hu5txukxCvRgf5eqjekdSuNAgww3Zyi3zG+JrUEci8DoIcTH/BShSiETrxKCd64gx8cqy81mfEwx/IcJaAwuh/gp84Wx9yjNE2ef2/8D5ZHXuWg3QJqJ+sae+96cIaW2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evBW52dh; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f035ae0fe0so117231601fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722842789; x=1723447589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO7Wk3TJ7iWuEM+gkEw6o+cg523KxLczIFJk+pJnpBM=;
        b=evBW52dhhNSp0Yxh0DO5981X2N3BG+TdmgDW2pNoAklZblnQQ7KpAJEfmDglXka0vn
         8cCZ5k+MITJE0cyOSD26DLMZaQklHXPfr5BuZoTfqgN/OR0xZT38AA7/VYy4Xs1EJHCQ
         +4xMhYH+ykJ0Cs5jBsH5BZuUzbemQA90tiTukbHEP5psQIv4KQnhz4/aLZqI1H18kKqQ
         CHF6eMHXSlm6leMZf4Fs++geqdXcjPsQbVFJIXZ+xvI31l5enlWn7xOCZB5KaKl5nVyZ
         PETSOoy15N6qRj2xfKAm4vVu19Mngac70rSuKaF5F1klUPMxexJDtvAnfREJyhHgtTf8
         Ez8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722842789; x=1723447589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO7Wk3TJ7iWuEM+gkEw6o+cg523KxLczIFJk+pJnpBM=;
        b=DGP9OdVPAE9hPHHWNUEvkjDltbDsbY/SKxchNLHV8v0H5bY55jQ/9W6efi84xciTpW
         NU0p8zSVPAAm6bVpcuNxbZWToZkWMG8OUFm7MRVHeC0vdyfPah1X4foAYo/g0l0vNGWj
         bL80/yQ4cIKH1DR7Gs2Rb5C2wLf+vEcQxIQn1RY96S/TgnQNwXkvddHf15fzmUqYjB3c
         hw1FFEGKcQY8yv77xDpVc6Y5SW1E9Zjru9zjMOD8cenC/b+IzGxK2Mnx6ABfHjxSPXlC
         iRq4pjF8my3XOeHjdfsNRdiVeolbong+t/SxmJBDpGaz3iwC7oq4zY8QK9jo1ZQy4kcC
         fw8A==
X-Forwarded-Encrypted: i=1; AJvYcCVu06Hftn1ocBlKaDx2fCAC/0Ksudo4Syo2WbkNXKCM9p5Q2FCZD+h2bSfMeI4N+HGwtqKvbaBlo5dqXZl0WomqQOuSj30e4x7FSA==
X-Gm-Message-State: AOJu0YwygH6MZjAyPcth7iEI/e6nW5XUY6FgzSyTg4xwQy4mvjgtB1z2
	+gvhUI9+CO4ZfRwf4AjqrIMp6eNUNKwR+y2VOT1yr0u9VLQeOBft87M6Jh0weoXuMb4S0sX8Aaq
	ul2KKLd+OI6IZ8KAbbGZG9MVPNoSLsZsf/Qrxvg==
X-Google-Smtp-Source: AGHT+IGf8NZlO/zg/jvFJewdvekiDbzVLImFMNrb8IC/njy2EYJ8sB8ApjMi473HW3YkMlMi/1SSiSzZnaLI5kFHYws=
X-Received: by 2002:a05:6512:220d:b0:52e:8141:1b2b with SMTP id
 2adb3069b0e04-530bb6c7fc0mr6727652e87.57.1722842788776; Mon, 05 Aug 2024
 00:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709162009.5166-1-rayyan.ansari@linaro.org>
In-Reply-To: <20240709162009.5166-1-rayyan.ansari@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:26:18 +0200
Message-ID: <CACRpkdbPPoFbytdUP1_x4Hfa7Ps23m=gHHAOKTjY-obDDhQ5yw@mail.gmail.com>
Subject: Re: [PATCH 0/4] dt-bindings: pinctrl: convert remaining qcom bindings
 to yaml
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 6:20=E2=80=AFPM Rayyan Ansari <rayyan.ansari@linaro.=
org> wrote:

> Hi,
> The following patches convert all remaining old text bindings for
> Qualcomm pinctrl to yaml, so device trees can be validated against the
> schema.

Patches applied!

Yours,
Linus Walleij

