Return-Path: <linux-gpio+bounces-4513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54F885F2B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 18:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF21A1C2395D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 17:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6452313540F;
	Thu, 21 Mar 2024 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=destefani.eng.br header.i=@destefani.eng.br header.b="EfASMgUD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24928135419
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040431; cv=none; b=it8oH/GIR5tcRAxKGEmRfnZIDLC+4kjXluuDCKT1aAp11oWf6xvdkBObTQ4zUqZEjj89s8IXr1+m+0dtmArijhLkaXEqUSuMucivRfOCrWbKb+VV/Wonyf3UzgA16yLk3rOFqBiQfsceH4e6mulD8B+rSOK5ylqyJOEWViwp6Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040431; c=relaxed/simple;
	bh=oB5zoBAMIIUAKl+NPEnh5d82Frfnml2dNHWRJ+Pa6f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/MyHVTlLdLUJhip1O5f80Bxfj/UwzM4tNenWl5QksdM8+2NTywcCffFsg4+RQS04RMvBXpODgkV/l+kTjWCoVhQL/zJV+uwLNikIacmhGIYD/hLATgOUXAtAxvnsK1SPp4fRcWHGKUSPJnmN8wgA8WYWfqM9Ql3eHe+zmiT0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=destefani.eng.br; spf=pass smtp.mailfrom=destefani.eng.br; dkim=pass (1024-bit key) header.d=destefani.eng.br header.i=@destefani.eng.br header.b=EfASMgUD; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=destefani.eng.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=destefani.eng.br
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36864f7c5cdso3056335ab.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=destefani.eng.br; s=destefani.eng.br; t=1711040426; x=1711645226; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uEPLM7OkKexBynty5sXs1ZBTiCkojoMeCpVCGiFLV5k=;
        b=EfASMgUDWMjes2b8O5EuiHK53LHra/usm64BhDsZQyJundGZiJTO0ODrP8nKotD3KS
         ms22JjEOyUYZqCuna95lPpSbgvJCKCKvf1/jQs9Z9Fy9EF3qZ/S1YMOVDEcI9fXf/mtN
         2mdC7r51iZUkjfSk2IRV584OgBvOH8tk91NDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711040426; x=1711645226;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEPLM7OkKexBynty5sXs1ZBTiCkojoMeCpVCGiFLV5k=;
        b=jHAIYKU9HqLBH6oFqxg++Rm96fPSAByXONw/hqE06ojP3czLoRX/lqjqsD9gHzAHma
         gQDd50oiHPHabfvpI/nhFngoaJUnGA+QsOVsBa0F8M3vCQdQJSMKpSy+KYm4n9TVBn/z
         OvjFsTsFie5dZALqulvAHlp9HGnWyjBT/2UGCwqItdeXNz0cvn3uVixzFjOdjzynOCap
         4HVGmLwTN96hqkIdYq44UzTbltt9rN8JPcMrOo0+lH1G9BZrq6k36kURSpCgPDWIhpWb
         JyZT5pgWXJLdQnLq/7ztCXFbSY9B9Tp+IlC8yE5qNbzfRAcrtUgc7DnpybL1I+JWNDaa
         n7VA==
X-Gm-Message-State: AOJu0YyIOrcSMzZRo/sBFBuWH9KmGW4tC0gh6K9lI1doa4IcFkjhL5rf
	KVe2St5GqhXbZ68fiLQ5CMQjdPpVobdWIdZSgVfNcqMQkyLYOHgBQSnS3WwiMlzSEcSl7x+BZ8L
	9
X-Google-Smtp-Source: AGHT+IHGKuH/5XIgWJzPZZK8/nEM0rHLmf7KC14e1l+FCy+WzSqBoLeTQyVSlGVui46m0dnrLINRNQ==
X-Received: by 2002:a92:dc83:0:b0:365:29e4:d95d with SMTP id c3-20020a92dc83000000b0036529e4d95dmr57794iln.30.1711040426413;
        Thu, 21 Mar 2024 10:00:26 -0700 (PDT)
Received: from toolbox ([2001:1284:f508:4314:8c5d:889a:4b96:5])
        by smtp.gmail.com with ESMTPSA id l63-20020a632542000000b005f034b4d123sm43209pgl.24.2024.03.21.10.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 10:00:26 -0700 (PDT)
Date: Thu, 21 Mar 2024 14:00:18 -0300
From: Guilherme Destefani <linux@destefani.eng.br>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl, steffen.kothe.gc1993@googlemail.com,
	linus.walleij@linaro.org,
	Guilherme Destefani <linux@destefani.eng.br>
Subject: [PATCH 0/1] gpio-f7188x: add support Fintek F81804 & F81966
Message-ID: <20240321170015.74544-1-linux@destefani.eng.br>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.42.0

Hello Steffen Kothe, and Bartosz Golaszewski,

I have a board with the Fintek F81966 chip, and noticed that
the GPIO exported in a physical pin wasn't working with the latest
kernel.

The board is a https://www.jetwaycomputer.com/MI24.html

Reading the datasheet and asking for help from Fintek for
a way to make both chips work, I ended up with the patch in the
following email.

Bartosz, I sent it to you because you are listed as maintainer for the GPIO
subsystem.
Steffen, you made the change that bring support to the F81804, so I hope
that you still have a board with the F81804.

I only have a board with the F81966, so I can't test if it still works
with your board after applying the patch.

Despite being a small change, and following the method recommended by the
manufacturer, it would be nice to test this on a real board.

Can you please test this change in your board, Steffen?
If anyone else has a board with F81804, can you please confirm if with
this patch the driver recognizes the right GPIO for your board?

If is there anything that could be improved in the patch, let me know
and I will change it as needed.

Thank you all in advance (and Yu Chen from Fintek for the guidance),
Guilherme Destefani.

Guilherme Destefani (1):
  GPIO support for Fintek family F819XX

 drivers/gpio/gpio-f7188x.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

-- 
2.42.0


