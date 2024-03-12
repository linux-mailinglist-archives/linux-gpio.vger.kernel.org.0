Return-Path: <linux-gpio+bounces-4260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDC879409
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 13:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB1271C2153B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5178A79DDB;
	Tue, 12 Mar 2024 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hUOIshpi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97905BA28
	for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710246081; cv=none; b=cOZ9JuXBdzNvb8kKlSYLfTn32hNUFV9QzTKEK8wqhoSwk1T75m/i8RX/RjVNL+BLAJTHkauZag1epI566HC/8WxjcooP67Cm6kl8NBlJykuYUOdqdXAaN5hH/ZTxnOG2ypXItQ1StsYNVLB5/wErLj10MxmV+gGQ1ukbuJnWp3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710246081; c=relaxed/simple;
	bh=LFUf7gZhUPLZ4CjNM2s7DqJqmJdAfqP0ybvqc+h900Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=i4UBf0aWHa1Z9ndn54SSH22ft0WoVQyBfzzRYIfzvXyVqck5o//G6QemLda69Du7ZC9461W1ZAgLL8SKQYEbh/3++tR+UJVPaAg/i83Jt2kJIHVKLOsDq9tmNFbA2iJTFf6iSGO6LsCVpFimDgWw4usDXgY08xJqOYMd1XILIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hUOIshpi; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-47341f709c6so882545137.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710246078; x=1710850878; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LFUf7gZhUPLZ4CjNM2s7DqJqmJdAfqP0ybvqc+h900Y=;
        b=hUOIshpic7nV5RvU+F4ZcKeS12EDcW6E2yfVABJh/B5JR43yU0AxGFqgW83/eK/rxW
         dIX8RmZBGK7CTuuOaVqh2EDAIgkH+25o1oShjGu3s4l7i5YkTSJTPwHZPTis91sKHuRY
         kK7O1HFUlFNc4y1xYbQXFG4yuqSwDrTqVx5V1en9ix9rikI5JK30B8To7T4n/w1J1Jzv
         ycbp13HUwSq4GsABRNxV3STZTGN0be8IhUU10wmWoajG0aGCyiH0G7dTxfH65nlAq4sw
         TlB+1dFDPnOFhDZSIZbG6Oh4RL7bM9fPi3gv6JBeVXhihgP6vp2Qnhekl1ZMJvKUXheu
         QNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710246078; x=1710850878;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFUf7gZhUPLZ4CjNM2s7DqJqmJdAfqP0ybvqc+h900Y=;
        b=EdeE3CX/6TyVLg0a1JIf7g6S/adlRxVa1NG95mBVGhrLH6rW7WUqUrjOjmW+PUq7+x
         gDYC7CXD6cTfxIV24+A1jrUa/74OyJKvrTD4ntrhMYRbj5CZeaQO2AcYAQHHRkcWOSIq
         44mPWzzZwssGlA7wR0ERL35uIliIbgy0Z6nY6bK95DtNIZgfBe4wRxZOrgLJF2GjoO52
         D6RJHSwWbRcNKyQt2f8dia5+kal3F+YtxbzLBZiX1hveyYLBYP0rVco6HppLQQywnEGY
         9yZKLsdxqbzSrKa5uXuinMJXCGThzO6WuS1veSejPDEPFCFxW1Eu0NWb7YP3ggPA8OZa
         HIYg==
X-Gm-Message-State: AOJu0Yw1gHvu1GH7bkcep2Twglet2WuCGfBOfT113D6e+XZiwPLC6fRw
	IdRu8zyqy83JWZAcINRXjP8WbwG7OfMk1Mp5vIEq496VW0iSeDo1cIRdHobd03hHR5vUm+gcD4q
	aSfRGE1zFGu1J+OBVT86PN+Y6VgTvGxnBMMyPZEVhFt+cD7LvyWE=
X-Google-Smtp-Source: AGHT+IGUeY+U/5/JdMaIZ7IyP8Vm4vuVcoxUlUruOV9YD18sab4OmqNETYjR7km/hZfQopezAVOytDTMIh4hNOHYRPo=
X-Received: by 2002:a05:6102:4413:b0:474:c445:6c27 with SMTP id
 df19-20020a056102441300b00474c4456c27mr506929vsb.11.1710246078389; Tue, 12
 Mar 2024 05:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Mar 2024 13:21:07 +0100
Message-ID: <CAMRc=Md8=qoGAOkPbtYK70JEwcpCAh+KP6fv3yfs-y_OeAPCXg@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.1.1 released
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I've released libgpiod v2.1.1. This is a bugfix release addressing a
couple issues in core libgpiod.

Details can be found in NEWS and the tarball and git tag in their
usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

