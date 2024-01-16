Return-Path: <linux-gpio+bounces-2276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203982EB64
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 10:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 927D9B231E9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1B912B90;
	Tue, 16 Jan 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C3d/UE+x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F6E12B82
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4692b24f147so490567137.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 01:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705396731; x=1706001531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLXetOoUkeEd/AGhlCJ3VkfH0QKAsu1adiFwQyMeUl4=;
        b=C3d/UE+xjtYJm/1ikCDTcc03d0ZEes3X7jstunl8izC8HolNkDFqyh2MyAGTaAv0fj
         Xb43TRa8LN8RHFAJPgtW3RMGmkrjE/HbrHkgHTm3Fwrzfmq0JoEqf6jVZ7i0k1DXMghd
         oPL6mIDNegmSqz2CuSnqYF3xSAUf5ZdFan7MieMGXFTPigb5qoSLVLvXAmqbuCtFu7uo
         NpeWK8tSlSieGfNTuar/c7dyN1s1qr/tAPYvJgBg5rG5OWssk2lbftw60uMndolr06FQ
         Oj9A+JFnEJCOaCbNOklCra1aMlq0FW6l09OIo3g1LGk/7YvXI2QwxseYU3E3WSFQ4m9Q
         gXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705396731; x=1706001531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLXetOoUkeEd/AGhlCJ3VkfH0QKAsu1adiFwQyMeUl4=;
        b=ep5fVBfPm8+rEJw03WHW+8cfvmPr5340fJSPSX0pTp9se1gpUB87Q/kv3MR/Acemew
         1/+lssaCtATzygyzHAF3QUZl0NPQJOwOSyOfGQfFwVLag8IZrys9vFz4DvTIvRELu5cO
         vlkJM8e7YduQyPHhFiGDaL7ruKzomJ7oukJQploY6cLYjDCzY/e3PAPxvWn1ou7UFdzk
         VqqBFxqKXZhs8eEgb8M0QX421zC2XqSn3mZOpn286Sms4NakFxFBM1Kd9TE8lCIJNEsR
         apkGdxUCuG/CGh0QrsQllUsBhlvn0R+zBspZXcLw9WUK9yXo5NUHCvLRhZ4PuqRoUrMZ
         dF/g==
X-Gm-Message-State: AOJu0Ywbli+TkivWDyX8xwaPUy7PtuZQ2a/99+itLiY5YYgYrLUZDJ0d
	bJa883I9wS2QWeSruw8aJLDHeVHk/OW8xqL/n/AX2zWQuGnN7w==
X-Google-Smtp-Source: AGHT+IFuJzit3P3Zwb3EERW2zRzoZLTMlcuJEg4dEzLLwgv32vSJlvB3ajlvZAXTKajGVooj4VKfmQamHcwLA9nYCKM=
X-Received: by 2002:a05:6102:3965:b0:468:1c62:527d with SMTP id
 ho5-20020a056102396500b004681c62527dmr4110461vsb.14.1705396730768; Tue, 16
 Jan 2024 01:18:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115111929.28628-1-brgl@bgdev.pl>
In-Reply-To: <20240115111929.28628-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Jan 2024 10:18:39 +0100
Message-ID: <CAMRc=MeFFmR+wPDfWCtpaLX9cq-YPBQ_mFnRCGftmhuch4hb7g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 1/2] README: add info about the github page
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Phil Howard <phil@gadgetoid.com>, Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 12:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The github page over at https://github.com/brgl/libgpiod has been reopene=
d
> for bug reports and discussions. Add a link and a mention to the README
> file.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
> ---

Applied.

Bart

