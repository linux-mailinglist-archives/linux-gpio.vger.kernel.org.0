Return-Path: <linux-gpio+bounces-661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E0E7FD60C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 12:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E44A283155
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C561D531;
	Wed, 29 Nov 2023 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIBOZqtq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C253810D0
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 03:51:44 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a00b01955acso946307466b.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 03:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701258703; x=1701863503; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/7TWKqMm5wxlwiFYkbPL9umiUw0KOwrobwLTnaeQKI=;
        b=EIBOZqtqyQDveZzLmFH3tSiQh+1Bz5oE8+gl7WUNmtT3XX6RyP2G6QGs1LymT8IbSw
         7ZhFBv/VGTE4Kz3NKqxzPWfN4aUx2uFA4A/mOKPNucvnMDhJzOTqHrssbWwh0h84bZhK
         +R1F6y/yMt1kR5P5GbuqxWfUhUB4UuafzG9kf0OkbqzV9TesrBvXahiMSSm+SUujne9e
         Z36QA5g99zokkFESp4YnDf8gfRCswQ6grkkcFR7Nxaivl8zFjUtD6vZyl9QTMaqumUbV
         lkKppwuSUPepRcctPFMc9Xpvy2lZLAVMoOUzTxY/17tkbS79rrrlG5x4ujA+AtPI8cGZ
         kECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701258703; x=1701863503;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R/7TWKqMm5wxlwiFYkbPL9umiUw0KOwrobwLTnaeQKI=;
        b=l/D7PCegDlAOzGhxegc3+uuowlzIzRX3NLpbcCB+95p+1jOFtWHN96XRq7C0ovXn84
         UMNSyqozQJX5hFt2qWOkraiRlXJ1fOQJlXKhwJVxXVgjcGqEtAsh/7iOF3lFFuiMeIPH
         OrirrGTeYwb+Tn33toKpFUt/ngMLuxfA928FLUMxGLpJoVEgoCPpf3jitZtVpuXXV5wM
         aKLQduDMTsZwG7OssYlEUp7l6VMvva4Ox9YrgsZgh7eGiVrItTPSSc19ZDyE/nhDtxBB
         m6UcSKofu66h5OgCmT26cOmALe8QvipB7BE90tjrWFh9JrPDzskUnmhZKhMsmtg/dnm/
         XdLQ==
X-Gm-Message-State: AOJu0YwMDYboa2G1inYiNGvQ93iIDE0iLC60d/YeliFa5D4OrvnZTphm
	k4nMdXuO38sJmz/0DQFBg8lPPjvqyvlz7+uJhLY=
X-Google-Smtp-Source: AGHT+IGG0Ng6YwR2F+mtDLBA5PHqC8hZLfCq7E6XOXdkWCc0XJGlZEXQigN34Q7fT+VLQv4us+IWnQ==
X-Received: by 2002:a17:906:68cd:b0:9df:bc8d:fbc8 with SMTP id y13-20020a17090668cd00b009dfbc8dfbc8mr14531549ejr.37.1701258703173;
        Wed, 29 Nov 2023 03:51:43 -0800 (PST)
Received: from localhost ([2001:9e8:d5b6:9400::f39])
        by smtp.gmail.com with ESMTPSA id z23-20020a1709063ad700b00982a92a849asm7837968ejd.91.2023.11.29.03.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:51:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Nov 2023 12:51:42 +0100
Message-Id: <CXB9VMHQO0YW.2CWER3170BJ64@ablu-work>
Cc: <linux-gpio@vger.kernel.org>
To: "Mathias Dobler" <mathias.dob@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: libgpiod - stop waiting for events after request released
X-Mailer: aerc 0.15.2
References: <CAEydidmWPSiyQPOog=9poWEhLLWkJh7Ue4Me_O0Uvi_BYO7XKg@mail.gmail.com> <CXB4K7SKB60P.3HQ6SAERTVNGW@ablu-work> <CAEydidkS15-boJh+eTbCRJ_RWL=VxVNNXmTSJXBPKUjGPZOrFg@mail.gmail.com>
In-Reply-To: <CAEydidkS15-boJh+eTbCRJ_RWL=VxVNNXmTSJXBPKUjGPZOrFg@mail.gmail.com>

On Wed Nov 29, 2023 at 12:21 PM CET, Mathias Dobler wrote:
> Hi Erik!
> Thanks for the clarification and pointing me to the aspect of thread
> awareness.
> In the link to gpiod.h 2.1 you provided, it says: "Different, standalone
> objects can safely be used concurrently. Most libgpiod objects are
> standalone."
> There exists a warning annotation about thread safety on these 2 methods
> 1. *gpiod_info_event_get_line_info*
> 2. *gpiod_edge_event_buffer_get_event*
>
>  I try not to violate thread contracts, but in order to ensure that I hav=
e
> to know which object can deal with concurrency and which not. You mention=
ed
> the *line_request *being unsafe against multiple threads... did you have =
to
> go through the code to find that out, or is this maybe implicit knowledge=
?

The short answer is that's what the documentation says :->. The
individual line_request is standalone, but reading from it and closing
it at the same time is concurrent operation on the same object.

The long answer is that I did not know this a few months ago. So I asked
about this [1] and then added it to the docs [2].

[1] https://lore.kernel.org/all/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work/
[2] https://lore.kernel.org/r/20230928-rust-send-trait-v1-2-30b4f59d13cb@li=
naro.org

> Regarding the solution about my original problem: So I guess that would
> replace the usage of *gpiod_line_request_wait_edge_events *completely,
> right?
> I would have to get the fd, poll and read events (interpret structure and
> so on) from it and write exit signals to it?

Almost, but you do not need to read from the fd on your own. You can use
gpiod_line_request_read_edge_events() and
gpiod_line_request_wait_edge_events() once you know that something
is pending. But yes, it requires a bit of leg work.

- Erik

> I am not a native C dev, so
> that would be quite a task for me... I think I might just fix threading
> access, to have only 1 thread access an object at a time, and then live
> with using timeouts on test shutdown :)
>
> Mathias


