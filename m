Return-Path: <linux-gpio+bounces-21721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23683ADE674
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C67AC1763BF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 09:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7A8281503;
	Wed, 18 Jun 2025 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTzFNfW2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4749281369
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238349; cv=none; b=uWSkh+6Plb5SiGQnQyPiT8PYPylFnGWQfLDXo2NavYvrDyA/OdqQBmJ2Jp9/atjYDKp4Ga413icrdxqooMeZCg9WUfEHmrXM2bD0AWQH/3MTNt1PIYQRkIcwqD2VP+mobILm0gURKJ/FqyQmpTgkFk/G4b02KOJ8HTRAyX9JtZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238349; c=relaxed/simple;
	bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvpVTd5EaqgfPm9Joe9BD2smzgDesu27dHYL9wsiSr+faAQdNhd2W7Lju6Bp6aYfTM8dunodA36LbtP1JMJGCCAr2P0imr3uHz+xEWFzBP6+gIdmfvZAUZtxaJE5A2DBH2qq1ikzaP5xVnmOLIAC9Md5oTwpPsxjdzD0Yl64LPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xTzFNfW2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b544e7b4so5609579e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238346; x=1750843146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
        b=xTzFNfW2eQmscrXSLbo6IrF9LP0y1iD8YrmYy0VFS8Tf/5gnEqXkv7JufStWeSInsc
         Zp/BRFb6Ogo0zWfUxCKSPRi8PJ2lo9k1dWbqgZt4qMopeN+8hBxNzFLrZbw6Kzg0L1Lp
         4tSqkzBM8ESmQ3XMCK+Gy2dGQ2ikjJqCAfjmmhr8Wrum8EybctoCr4MAX5zD4ziP9v6U
         j7IRxxrxqSsTmHVkf3ZmmHj2R0J5EKAwQQh16VVLgU/u6YtAr2VHx05zC176wmArbK7K
         a4koPbcvjjM/ybiuQDyqgUdq3Fnopvp2bWwn8IPfCZuYDbwl/uXpvtB5ml6Jr5XIOrS9
         cEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238346; x=1750843146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
        b=MDNoQRgL6hzNF6SIfuhBtYM+Jay0TVL3MT0U7dH1C73QYcsRA1KOph5z7ZeimBkkCY
         ZTMdgavlXvCNgJCfmxQXhzqySWqeFZLjs1ixmtBG4lWAM83w0puAFe6WdyvM91tWyFGx
         bdGjc7Qixblzfkl7jR3WQFPhj/MfgBdS883LkDR9C5APD80Hn5Knn6u6PN6+jXDAJb4Z
         atG56xlUd7jTFDuS4XRb9QeKlFT0bVTHW6YgPg68XknI62iXCHwQVT1/JOXZT3Vkijp1
         m0thIRHDELvJ3o+CxqpZs7sTyod1cmIimgyMsTUKX/6CAJQh4mbiun0q4+7Tv3OgOytA
         tsig==
X-Forwarded-Encrypted: i=1; AJvYcCVESW1as1asFhOBOj6cEi3c2AkF5Iq6tt2BijZ4xo1XzEPy+kuzfKTzbyKWJ7lN6PSAT+iDE6Ud4KEd@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqEZHejn4yEgQIl3hnNYdxgciGUYm0iOrG3XzCZ8uLecF87En
	kT0pg8ob4XN4N4KVSerzeN4NqFm+I8DaskuFs/Otz7LN2mIQUBdQyIAkSvs1wVrxyCwfQUX8uSI
	ejBdoA1ZufPqfpOYDFI7wmB567KjjIaaRU1DWED0OBw==
X-Gm-Gg: ASbGncsMNw/JJwxHsG+eYG119/ltIlaYUFMvqdexuHD8IWUbyZLTpZ1ccTF+4lz6mn0
	jQvOTu/IqTmh8f50Vzu5YiVTkFDdw5h2Fy7Bd7ayFHnupfzjcNzJGMeVN/UPKZus7XqMW3pMo4o
	isuZ7++NsKXcAR1+4Tv5sKSftiNWkrqfITB5U4zYigPjs=
X-Google-Smtp-Source: AGHT+IGDviP5o5BpdYRHMCQZJ0KKYxkJwy63WpJVsRhdouoscbb+olcEs5D4kGqoukI8Mi1y4ymDThNKrTMCoqXbPKI=
X-Received: by 2002:a05:6512:2212:b0:553:2c93:613d with SMTP id
 2adb3069b0e04-553b6e713b0mr4277828e87.5.1750238345840; Wed, 18 Jun 2025
 02:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606160359.1356555-1-Frank.Li@nxp.com>
In-Reply-To: <20250606160359.1356555-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:18:54 +0200
X-Gm-Features: AX0GCFsZz3aglhMm4E6BI1RVEFU98orqUWOtObnRoTsKi2nEtjPjvdxkzVSQEu0
Message-ID: <CACRpkdb9=PxzA8FGR2=Ox+ndnAoh7LBB+QVte4kU246eucvt5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:04=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert nxp,lpc1850-scu.txt to yaml format.

Can I have a DT binding maintainer ACK on this patch?

Yours,
Linus Walleij

