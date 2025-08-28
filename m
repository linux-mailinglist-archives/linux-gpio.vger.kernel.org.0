Return-Path: <linux-gpio+bounces-25166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A443DB3AC72
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 23:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF10AA0440D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4B22C2369;
	Thu, 28 Aug 2025 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qDx38l6W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427F2BE7D7
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 21:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756415022; cv=none; b=dOnN7Cu1M1SZ5rE3KtWhO+XvNKrX0XJ5a9wK31RDT0MDoUdJTVCS9y8pa0d7hGtD0XeMcbRjqYlflI0K3T89EUfPWNUE21FTki3p4YSiP3ax2Sb9x28lwFkZkWGx5gZPBFNMZxeAaKGXOrIPDfJ8A4EeAR2/dfpaMv0D7wtqUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756415022; c=relaxed/simple;
	bh=JpqemiYOa4qZgBu4emt/PYSqWqeke/6L1n6Biqi6C3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoEhynSvKFVIbxp4Ut/05iRmfRS1j+5HBJ5Oh4g+LlR8s3/jQJXvoxBR3OPP/DZBKvI8avn/LNfdGGJJJxVzrXhgCBu5ChY8nFZ4tWnO8owPRspjqYX62Xpfu8+h5tgHa4fGM/G3yBAtTBS0zoMO0ZMt7TNjZMVPBVlxyyfdPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qDx38l6W; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f5cacecffso1639366e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756415018; x=1757019818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpqemiYOa4qZgBu4emt/PYSqWqeke/6L1n6Biqi6C3E=;
        b=qDx38l6WdYgqxoFkRbvHMZmaBo0wsUZvg1lzXTBD81YUIeKxB9VRgpoPveh4Jus9T5
         QlvXf0oPQhy0WodEb1wYlt03dSeV/kTK0L3y6AXRBqU4xZ8cxj8iNbtBoJwe/b/tt2GY
         03Zn6WRhN/MS2xJ7Lb8VPns2VzzdQ+gRa9Rd1o2vEzpFoZpHbZTI+6UM8HyEcsJB/4Jo
         xqhP7su99DofEiGTMcLtEbgH2SFkRpvUeiVWCp3k8WRQ/hY4b0IxeR/kbaxzgkrSWuEk
         l3EE0a/B5cu4cW94B4EQVbq6Sw1zq96CjOLNDDmjNOWyUScrM49qW0FSTtboaDw7kYNG
         leDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756415018; x=1757019818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpqemiYOa4qZgBu4emt/PYSqWqeke/6L1n6Biqi6C3E=;
        b=GyI6NbYAzUXZWFjSSbyT5+BNcRofaY0GzckRePq+/TuD9rlJvG4+tzMSIJiMlDMQ7s
         rrQXQLkhC5PR97/ibGAubZfGKHHp+SL48iAmdLGSxtwhXfeLHRmeT8LJ7LG0hc50VLlg
         k39v3xBVDzsaMB9BXuTWUV5cDiJgOYWCw1VLebNHrHySaiqzakmGYAKxAigmURFSykK6
         1SINEKw9lS9VpIZlz3F0eQhYA5Ly5RCEMCXeKP0jrJMgLQtGoJzWVnEEd2NHFi8pUhjy
         ZBkZt2qmYNVmC5ufyw+kT7iOz/fAF+9vstcBXk+yFbiNMcCx7Ysh4KUuNT5Z81pjrrzH
         kmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUarlpIKxh2GyLH2HUkFAyAn5q9om9AeHlRrCMxTG7OpldzXO2ufTU8DPt0wbEhlFUaqcwGqPFtzQ/q@vger.kernel.org
X-Gm-Message-State: AOJu0YwCOeLsDD4F6CvyAw0oJTp/8TrvtrA8m8xJl+FS65w2NdDhY3T9
	WDktCSBARW3I2wrLH8pt/U/ZUGcGVJyBySNxdHjPSc02+CyqcJpYlx/MtH8rWP748iXHluWwKSp
	0bS0NmWkgXbHMdupTczztslzQSZX5F6I9J9afSEKSOg==
X-Gm-Gg: ASbGncucUWkOKDwO6TIuOaLCNXaXXwf1mnWmqkLkSpF4feYJADV3dYPZBvLuklRlB/x
	P7UgY8g6U+YVljy7wVMXKAtkUEjL30KqK2D41q5R+UMQwAs+nPzMEGBJXPgd51bdHXTsf2+72Ot
	Xzuj+fpSxMMvh69iBvun7ss34guN9EcAnMNv67aJ/IbPeTDIBmEIDp53tyvTCPcbBTL498GRr8Y
	qSmoT8=
X-Google-Smtp-Source: AGHT+IEBjFJWFLGkbXGuhHAtRjCVWrmXlPYLpQwfq1rarphkzkuwgBTA1g4AurEUs7Vb+ka2DgQY9BMQPqm+5bNSxi8=
X-Received: by 2002:ac2:568b:0:b0:55f:64b9:3ab4 with SMTP id
 2adb3069b0e04-55f64b946eemr717027e87.23.1756415018205; Thu, 28 Aug 2025
 14:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com> <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
 <CACRpkdYXy9ZgbAZKUdquxdp0X0m5AHT82K74Ex-ZAyEx=Uwi1w@mail.gmail.com> <67e58bda-3cac-4689-831a-4e4116a0e19b@kernel.org>
In-Reply-To: <67e58bda-3cac-4689-831a-4e4116a0e19b@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 23:03:26 +0200
X-Gm-Features: Ac12FXxBf9FMZVXj6RcmihJXxBREGp-5LZAybPVE_Wl0j-njgxfgbqyikM_ygFc
Message-ID: <CACRpkda+iUfHKFnnsTGmXrvxpPSy7WTQRKaAu=YgXtcrsjXthA@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 8:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> > If you see that the "hello world" from that driver is missing, you know=
 it
> > isn't probing, instead of finding it out after combing through the .con=
fig
> > for the third time.
>
> Any tests for driver success should be checking in sysfs, not in dmesg.
> Most of platforms have smaller or bigger tests for that.

Yeah I understand the thinking.

The typical symptom of a non-probed pin control driver is however
eg that the system does not mount root because some pins
connected to the eMMC are not muxed right.

People find the problem sooner or later anyway, it's just that the
print makes it sooner. And the mistake is pretty common (or
at least for me, but I'm not the best developer...)

Yours,
Linus Walleij

