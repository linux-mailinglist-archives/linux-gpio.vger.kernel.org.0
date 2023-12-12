Return-Path: <linux-gpio+bounces-1294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A0080E84B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 10:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E306F281244
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 09:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7F15914A;
	Tue, 12 Dec 2023 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxbQJL41"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA04FE
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 01:55:30 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-464892990beso847011137.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702374929; x=1702979729; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYoY6OKKqZ7vbgIzRmtTxlw6WNWUoLG7MI4rdyFCTSg=;
        b=SxbQJL41P4iVUfgzA5tvfsDPP8gn5kSQG0aGQ6is7UqDWVjGds/Y69U1/fCKuQbY/D
         01U9c4xURgRd9xHZVdcCGN2StTAhcpieKfNSo575QNcxWl4ImhVLUz0krPLVR//JFZWh
         1VtKBoNyoOX4H/G30UD0A8ATY2PcDdllPVfSVjniYTkp8yegq4tvemBtE4+yeSDCHhND
         ATjwF4ZpsFICGfYshdlFUHfAjbgvVAiwSQZ/Alohi/iSh2KZhb/DiUXvfIQ8YDJELrwm
         ednH1jLm0OhvFduQL3sYNuExQD+rIQAnfC+gTq9eV+Be1KkfmV22N94MHrUImPfnHqEm
         eBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374929; x=1702979729;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYoY6OKKqZ7vbgIzRmtTxlw6WNWUoLG7MI4rdyFCTSg=;
        b=jjpdVlLRrgCErJs/TvnhAL9VGqtA7Tr34ZknZbFxE1RXWr9ZAAPPXtSKEyB6I9NpDd
         Uo49MmZw69bN+NA3XJ3NHNrqMlPmj4mG/gZcDlnAHYLVGjZpVxhRbMtfo6SBdkJ3sR1/
         luY/9sULGYhsGnYgLzUvrqgvqosh6YPUnwk5ea7kCOuh+av/qMzWQ+2RGiRfUoue8HGa
         yrPQWmJPqVZ3QAb3qqfgR42qrfVdtwbv8QbmBZzKgRy7n90i9eJpVVvGzhLH9Yp58Q6F
         g4f42I1h1gj53q8hJCeW7fu4JTYkDFhI9q34Mp3ZkiubSwVAGN7oHyrDOVq8QmOIht7B
         Spkg==
X-Gm-Message-State: AOJu0YyGN+kOJjDwtn8H0C37ec/d+XfL2WsxdjDX0lJj7ET82t56ROO/
	cPzvKF+v3h0uij+v4IDYb8kZQj82KFoB5v2UgJDXEcS9P/s=
X-Google-Smtp-Source: AGHT+IEuE8Vb9rAbnSDZoXqBiKNhPXuL8DqDC5Xd9c5j/tpK7HKjKT+zXPd3TBkdJmhM/U3XHzyPt64+3ovG9RO84yU=
X-Received: by 2002:a05:6102:38cf:b0:464:4021:1f50 with SMTP id
 k15-20020a05610238cf00b0046440211f50mr2491240vst.6.1702374929472; Tue, 12 Dec
 2023 01:55:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Tue, 12 Dec 2023 10:55:19 +0100
Message-ID: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
Subject: [libgpiod] - fast writing while waiting for edge events
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
From reading other conversations I've learned that it's not a good
idea to have more than 1 thread accessing libgpiod objects. But this
raises the question of how to react to events and let reads/writes
through as quickly as possible at the same time. I have already played
around with the file descriptor of the request object to interrupt the
wait for edge events, but this solution is not good because it comes
at the expense of responsiveness to events, and requires complicated
synchronization.
How bad would it be to have 1 thread waiting for events and 1 other
thread reading/writing?

Regards,
Mathias

