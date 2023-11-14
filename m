Return-Path: <linux-gpio+bounces-89-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 907427EADA8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 11:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17EB1C2089A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB0118642;
	Tue, 14 Nov 2023 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So1ddI2u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBCC18620
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 10:10:00 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F42F197
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 02:09:59 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32df66c691dso3148789f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 02:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699956597; x=1700561397; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzLr6WWQe2iFbwqiQqPc3DPii5vm9Wk2Jd8Y61U6ZRE=;
        b=So1ddI2unRL6wYGGhq8hiI0LyJkouh01ez7QKd7vENlZmwYY9iInyqMGVva3tBmzxi
         SQOox/qpzaXIQAvkSSbveokB3dCLiA22rnEFwE22eccvE6DAplzLSNqcLSi8vuYXUlXR
         vdt6Ahonx0u9mkFylwQCECufAe20RjjYodPPnDL4AGaJelgYJdSARgO8JYFKghLhG4wf
         p21E9snO0ygxGB+2+XDYE2t5K/n0yemBvf78WuYxZfTma1rXvYdg7I20r+3iXP/zBDpn
         ntI80lCbdzoOvRArs9cAx8CV5GDe83lal2eiPfnUxdEwVsFBE8sPHDiaJ8QdfE9BY+dn
         s+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956597; x=1700561397;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TzLr6WWQe2iFbwqiQqPc3DPii5vm9Wk2Jd8Y61U6ZRE=;
        b=uHW/MiJOnHq0f7SOATfVhC2Elg8ky7bcVCGp7ixh75VHW8gk1v0QnmTOmeUeH45U6h
         +Wghg3QA0RSPLNbIiqo379xmZEQbpJxttYOhHihhYqQ06yQSPm5sF5beImAMsEG6FTDq
         EafsARyBmVVpskwPtNdJxwWFXhKYxwuZQcq38k8CsAeCOeDfSuKQ7kqPo+OCzoPUxyRT
         T4Rp1XyC1tInQdNa0zQ1jINZ8U9hJOY8T1dGPmeqkgs9sEqc0uTXs3OTN6KXKUPNrmiD
         kC9PKXs/nPOJ9RUMxl9HiqDI44sjjBmUjNWLLNS5gs9xUwC3m8a5sYm9i10belpiWG2S
         0+CQ==
X-Gm-Message-State: AOJu0YyHwmC8SVLtA0S4gYH7D/1ykk2RSlLYfkxQnft3Ohyy8Cmxcyh4
	bD1ybJGgJCWMKlErz6M2BoshWtwjiAiGoQ==
X-Google-Smtp-Source: AGHT+IEKRYRbCIrnidF56GY3BaejOY1ZcXOznijvXY6cKpp4iQMjbrFWvpfvEQzEWkV+GBZ1UHtBbg==
X-Received: by 2002:adf:d1c1:0:b0:32d:9fe3:6e4c with SMTP id b1-20020adfd1c1000000b0032d9fe36e4cmr6402388wrd.47.1699956597022;
        Tue, 14 Nov 2023 02:09:57 -0800 (PST)
Received: from localhost ([2a01:827:1724:ad01:4d9d:f50e:f7dc:7e98])
        by smtp.gmail.com with ESMTPSA id j30-20020adfb31e000000b003197869bcd7sm7483724wrd.13.2023.11.14.02.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 02:09:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Nov 2023 11:09:56 +0100
Message-Id: <CWYGBJ6SZ2UH.2S7NPDBHCGPIL@Kalray-lp232>
From: "Adrien Zinger" <zinger.ad@gmail.com>
To: "Erik Schilling" <erik.schilling@linaro.org>,
 <linux-gpio@vger.kernel.org>
Cc: 
Subject: Re: [libgpiod][PATCH] libgpiod: Allow to gracefully exit from a
 wait event
X-Mailer: aerc 0.8.2
References: <20231113143219.43498-1-zinger.ad@gmail.com>
 <CWXV8TMDNK59.WFY7K99MD7KQ@ablu-work>
In-Reply-To: <CWXV8TMDNK59.WFY7K99MD7KQ@ablu-work>

> This sounds like an oddly specific API... I wonder, why does
> gpiod_line_request_get_fd [1] + doing the polling in your code
> not work
> for you? Since you already got a file descriptor for the
> notification that seems like little extra work. Or
> did you consider that but find
> it too verbose?

Until now it works like you said and it's not so verbose.

Actually I had the issue some weeks ago. And before digging inside the
library I have searched in the documentation and also asked on
stackoverflow [1] for a suggestion. Despite everything me and other
developers were not able to guess how to cancel a wait event from
another thread, without reading the code of the library. I thought
that it could be a good thing to provide that feature.

[1]
https://stackoverflow.com/questions/77222869/how-to-gracefully-cancel-gpiod=
-line-event-wait

Best regards,
Adrien


