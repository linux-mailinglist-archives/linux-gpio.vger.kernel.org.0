Return-Path: <linux-gpio+bounces-23455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAD5B09D8E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E796B168CEA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C82B2192EA;
	Fri, 18 Jul 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pgrt/Mfi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE719E975
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826546; cv=none; b=Dl850jIY++EUIad+gXwfIpOyXhB1yHCvu487HrfL9puFth/MAhUokJj+17pSD1jpPfElZtfnnFhFpCAwOB7j5d++L7JTYAgXDRfmXNdtOYFd3+F3KNUnZUSbkGtthwFkR6B7tVOnR9Wn2GVocE9w1iyvIuQAD/Pn19qlcFziUbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826546; c=relaxed/simple;
	bh=LYG6dBi27owiZdJNQoV91+OmRsH3MroMWQm8w7WQq0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSygJXmThKzzBmCySC3lMIleQm2LGao+hJyn9GF3PY+nXF+wl5eLf7ZT2oACFCaNGlJeFsIBZF62r2dFuMV7AfCVyvTbdx4ZGgsovxpC53lmAosuTp65SmbxUTHOlbHn483lr5EII+bpok/dEBQLRqcxckE1WDPPS+5aW4iGkis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pgrt/Mfi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2350fc2591dso19161645ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752826544; x=1753431344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRoi/KdssEcNygdK/MFmLI3EXaQwQgEFjNwDzaC/Nps=;
        b=Pgrt/MfiqRGN68PUAHXT5q7cMHfSF7zTjtbN8ovzvYd1Bol/g7bRsHQwI8id39jS3a
         j1Z06zNMRtFLK9Rwrn4p6i3XzagyDuDFBoE2xemdsrR+PX4EyhPM/bhbQX7WJZ+ALLns
         RYZcs14+PZQMMqxc6hzybqTX5Y1XrdDNNXZmH2rRoX2M9zarGAy1hZrwZbMsStpFoVNE
         ZWpOSI91QF0vbywt593u3oI20uVbaYCsna8IyDabjb2FaASBxi8v29VsIufyUoyD1rpD
         z69E5C6Fj8Q8hswk9CD0bhUNVMLUVnjFnrKCpL2pwXoGSsUkBrNfN8XZm7jrKGxjhBCY
         yVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826544; x=1753431344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRoi/KdssEcNygdK/MFmLI3EXaQwQgEFjNwDzaC/Nps=;
        b=ur4VGaA3VMIue7luVNKw7MUHBTdtGmPLj50gI749Rx499XTXNOsSQ0kwEnrxcwv9fs
         hlixWNW/RnkJ8ohEEvhjHBgmGaF/wIcoYEDlBLJTopQk9DVMBft9Y8RdpHfOxyoqhMH3
         ZNnDoTTFzmht9Ms6Qazp/C2/HRdmiA83Jv7t1TnvWkqLZUzMxOa6dhIoRRkV/Tbruz6u
         W+D9mOGKJyKpp1tYh41b71uNHXCEwd8H/iTwFn+qAVBmpiymc24vuVzVDwVSablMwhWA
         PLkSb74fTusabej0MKXsClcEIpYEKRnzamLJEsAoNYe/wV8GhV0zfkggHG+YJ+sz3b0A
         EduA==
X-Forwarded-Encrypted: i=1; AJvYcCXJTkiAh8bVLfEQWrWQTWtO5q/4WqocazTloyyomyneDSCoKMqclAAm4HVxiFzdW1CZkNKqhlNBRVNy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz71o+AHeG7+JedcGOwC68UNjjhTwgYcLbnk7BnY3bnn/wwakaE
	7itoyWqESSeeFS8pieHzJedlwwlnz3hH+MNrG3llmhYjYkxPCzUjAk4MoyXYPPIEUHo=
X-Gm-Gg: ASbGncuay+Fj6l5U1n8pIoD8l3VKHmtA8QheZ41sckKKMXgkYxhP+qGpgIY04Wg2sPK
	MbZwivLo9BKS26b0Voa4y59x/KuA6TqvKmCCPd5nPDfNKvdVsNu7GYCxIcpPTxL7ORn3tIoAAe+
	afw2MdR6LIYospqon2oJthVW9iOFzzfsKXNPr1w0VfEpGgZPEtoGcWmrv0FHyoQtb8xLkgUTyR8
	t76pRlZjBMI5Fo2PEZr0yv4u3Z5NNub59ddXBaz3JvheoUtZdMsDdAoKnLT/w2EgW6I56bwJtWt
	A0Zk+4YKvWSpm6BIxqPHJZ5OnSb/St9zKS7H4NkP4OHKSDsQYidECZAFMNCRmejQx7/G/TlN9Bt
	0xkDR57a9nVBzCx9luVSNjkQ=
X-Google-Smtp-Source: AGHT+IEqHN85qJhRQ1PINudkBYmazt3d1yDiVwXAcZxkuOjtrSEpN31hW0gEWbObrF16B/ALKaw6eQ==
X-Received: by 2002:a17:903:94e:b0:234:2d80:36 with SMTP id d9443c01a7336-23e38f7f902mr45233195ad.14.1752826543694;
        Fri, 18 Jul 2025 01:15:43 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9153803esm3465900a91.0.2025.07.18.01.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:15:42 -0700 (PDT)
Date: Fri, 18 Jul 2025 13:45:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Harald Mommer <harald.mommer@oss.qualcomm.com>
Cc: Enrico Weigelt <info@metux.net>, Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpio: virtio: Fix config space reading.
Message-ID: <20250718081540.7n7wtl2sas4o7jz7@vireshk-i7>
References: <20250717141000.41740-1-harald.mommer@oss.qualcomm.com>
 <20250717141000.41740-2-harald.mommer@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717141000.41740-2-harald.mommer@oss.qualcomm.com>

On 17-07-25, 16:09, Harald Mommer wrote:
> Quote from the virtio specification chapter 4.2.2.2:
> 
> "For the device-specific configuration space, the driver MUST use 8 bit
> wide accesses for 8 bit wide fields, 16 bit wide and aligned accesses
> for 16 bit wide fields and 32 bit wide and aligned accesses for 32 and
> 64 bit wide fields."
> 
> Signed-off-by: Harald Mommer <harald.mommer@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-virtio.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

