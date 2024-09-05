Return-Path: <linux-gpio+bounces-9864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8896E12E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 19:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3FF8B25356
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 17:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C201A38C6;
	Thu,  5 Sep 2024 17:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4G4WRUY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6619C579;
	Thu,  5 Sep 2024 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557730; cv=none; b=dqRhkLGEUBtOaIf3yQ0NPWX361vPcTdnPCKcPvt3Lc6eojzcrsZ8cnvViNPsKm27IZ1UtoCuz/IKN56N8XaGC7zLHtaawbU1AKlrNZGxkLXBw7k2tVV/3IvCMUwbjRstkgX+7dzioP/bjzMShOkcGmbRDMgKf4PU0Azm+8j3yag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557730; c=relaxed/simple;
	bh=dtkp72CDrhjJbzD6cuVyGw6/CYzTZtkUgiLl1ho74YU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ng3r/GpOs3IZJwtDPdoXgGsRSVUaQO9sCe9KJvHZcxa4AOMHl1DJ1lbR4ZFPiHUbuZoMR5l7czJ5II/VYggB+U/dilSP8JIl7/kBPdU1ODNXwCHDN2aHOpQ6QIhfVK+wab0EKWN9mSxPhlE3g6b2WD8UWgG4ZcKnMVrzbjyJIJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4G4WRUY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5356bb55224so1350865e87.0;
        Thu, 05 Sep 2024 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725557727; x=1726162527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtkp72CDrhjJbzD6cuVyGw6/CYzTZtkUgiLl1ho74YU=;
        b=j4G4WRUYCGKmuNj42yk8sbqva7JcH95mQz+dTTXmf1Zp7lkWlt/z8FNQGR4yQsOFZM
         ZaIxn3g3xcs9sIcmWQVTn+80BWPEkFXKfxQhjupmHuemjCl6kJWmMHUGlB0+DUGIL4Rp
         G3sOUnN9xX8j2B+45T2rW3NQzReJIYSACPBy9tn0dcB+mZK6rF5Fq+SCMORZRuAL14hI
         9suaH6ILWRo9i5sqt7ZZPoU1sg9rCcE/2TY9+7D0qpcSh3FiV/XFsnnXWmQKC/oPfKj2
         e1QsKcxmLPXNX+HII6BXmIrb6Uijzartu7Cdzxfs9fBlj4uHKxO2WIV2i/yInD0eYuV2
         TPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557727; x=1726162527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtkp72CDrhjJbzD6cuVyGw6/CYzTZtkUgiLl1ho74YU=;
        b=Ar5h8yz3szKvrFH9Z21JidqFn0BhR71yOrw1sS+1Xm6UrHs5+G1ynMO5ZDdKIA9ac7
         drFV5aSSgT60CP1xouMhnhvWbVwhREvU1qGjVntg1h81TzhJb/U6wjOs16t3A2dHi3Ia
         1Ek9xO/j+O1alpCQtsFL10zHIVZTKTwEddhOhExrYCPe9JS1E1/xlWdqfDfCeIZL0Vcs
         YNCov+aOTDcZAj4uf9EqcVZsgCLCVWLyOVc4W/wQKDKNwzmUBZ1x7F79+xI7jdY4MaJX
         Z8RzocIiO4+CSvKDE6wzYPWIEltufDQb/iAjGY7UzutsjqeaYFOb/chWtQpyNCMhx+xQ
         L+YA==
X-Forwarded-Encrypted: i=1; AJvYcCVoeOerbCyEncaFmzOm0wXYxSjabVj/tXIFcbbMbngj+GxiA067AUYidrQxsURYLpeqFxOoYSFkPKMnABsS@vger.kernel.org, AJvYcCWVU772dRJ+PlpnbdAhRIzZqt8ht8BPnUeszAg2XDeYLYGZP0+1BZVDEZKKMGzEdz7btnOBEDG3rmG3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrff6eT3VvpCrB001gapEfXrM21AA5Gw8LngMSkrxIFptZjNZ8
	WugQfXu9EYGbeT2ueUmMg8rH+jZlqkECTcp+yKfuk3L+JnVnYZU0E2No4sdP3bYcuLhViwTnHer
	Bw8u3GficnGT5Pe0pC8QNlwM1JEQ=
X-Google-Smtp-Source: AGHT+IFaMA1tB9wsgS0ehIckx6dHiKcjyKZ9d9wiCGYT4pvGNgk5uvfKESRNui9lHOmGz3FcaWSIMcQvnRV+8mn1n10=
X-Received: by 2002:ac2:4c55:0:b0:533:46cc:a71e with SMTP id
 2adb3069b0e04-53546bc74a6mr15473699e87.54.1725557726619; Thu, 05 Sep 2024
 10:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905142249.707556-1-andriy.shevchenko@linux.intel.com> <20240905171722.GA275077@black.fi.intel.com>
In-Reply-To: <20240905171722.GA275077@black.fi.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Sep 2024 20:34:50 +0300
Message-ID: <CAHp75Vc4oKYRstpgzCr06YBST1L_svaynA4Mei5cQ_YQHwxC1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: intel: Constify struct intel_pinctrl parameter
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 8:17=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Thu, Sep 05, 2024 at 05:21:38PM +0300, Andy Shevchenko wrote:
> > There are a few functions that do not and should not change
> > the state of the pin control object. Constify the respective
> > parameter.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

--=20
With Best Regards,
Andy Shevchenko

