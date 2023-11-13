Return-Path: <linux-gpio+bounces-79-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5857EA237
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 18:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1421EB20981
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 17:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6A224E3;
	Mon, 13 Nov 2023 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFvv4YAs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DB224D7
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 17:39:06 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3D51724
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 09:39:03 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso717047066b.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 09:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699897141; x=1700501941; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQ28Q5GpE2LfkzF8WY3+zbC9t4OxEUwfiDF5eZDvhm0=;
        b=HFvv4YAs6cm/bEqXU1VzFSRMGuTZZoqtynXtwcbna2887iifYeZhruY14H3r1sye2T
         Vx979Qa6UH+jxnuwh1xRoCMBfAposoJuDAktlLSRDetCV5awNgqIZsyvn0+ld6G+gkaf
         +6UKV72vLLKIY1O+gm64yIwaZqUjzWsyho0e117/ACVihgybU3sFbQpkLTwL/gA2Ka6M
         lBUghuT3n9bbE5KOx6K9Q8hteLEuma05F3nfcG964BVQoQD8yhTiMBuyjUN+yZAZnprH
         vKQ+581+jIUo/TQI0lPYQPLa8vKEGieuKmJTENu26z9JdpKNMpKGTK9rahf3AcsJiyOb
         02Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699897141; x=1700501941;
        h=in-reply-to:references:from:to:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WQ28Q5GpE2LfkzF8WY3+zbC9t4OxEUwfiDF5eZDvhm0=;
        b=w7KlCNi3b69oA85fd/kVrLGr/FWRcqj2PMDQxg2BVN4k5zCoQ0rexo4WPDSrQJ4ROo
         lo8XW1RthJctG7fqv22taQrs3uhR/95AtaTM4MUR6gp6mY4X7JaFSZuDlkmE4DYfdocn
         nf0JTLYRzClW150nqZQIouQ8lCCJcZE3Ya9HqP+xTTSohKrMKhg1RkP5HiBVqix3cTBR
         dnsQ3kMqBMJnp0kI9YuryNU9eFu8oGm2wfEYH+JIGB773I0Jx0BwXux+04/JyLwzPsMf
         tblaNMSDTiTlXtLsKHdupITvUmtLH3n/slUGM9GrAabSgYEOX5i+CZqbz6RlR+ujfezT
         jmqQ==
X-Gm-Message-State: AOJu0Yw6eKmWLhti/OdqMu2Tm2+xxZ12FGVoPha+WO11/qmUBC0RAFJC
	sXAbYaAs7KIgY+vL3ly0fDAIIA==
X-Google-Smtp-Source: AGHT+IEK9ukT51zX1feOLm4tKfjrJ1UTIv9t+ZDJOQdITWUX93QNgqHoWpDkCa9xsv624YVkGgnYng==
X-Received: by 2002:a17:907:c09:b0:9e7:de43:af91 with SMTP id ga9-20020a1709070c0900b009e7de43af91mr6471839ejc.41.1699897141511;
        Mon, 13 Nov 2023 09:39:01 -0800 (PST)
Received: from localhost ([2001:9e8:d5b5:6600::f39])
        by smtp.gmail.com with ESMTPSA id dx9-20020a170906a84900b009c3828fec06sm4304221ejb.81.2023.11.13.09.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 09:39:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 18:39:00 +0100
Message-Id: <CWXV8TMDNK59.WFY7K99MD7KQ@ablu-work>
Subject: Re: [libgpiod][PATCH] libgpiod: Allow to gracefully exit from a
 wait event
To: "Adrien Zinger" <zinger.ad@gmail.com>, <linux-gpio@vger.kernel.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231113143219.43498-1-zinger.ad@gmail.com>
In-Reply-To: <20231113143219.43498-1-zinger.ad@gmail.com>

On Mon Nov 13, 2023 at 3:32 PM CET, Adrien Zinger wrote:
> Add a function in core `gpiod_line_request_wait_edge_events_or` with an
> additional argument `fd` to trigger ppoll manually from another thread.
>
> It allows users to gracefully cancel and join a worker thread waiting
> for an edge event.
>
> Signed-off-by: Adrien Zinger <zinger.ad@gmail.com>
> ---
>  include/gpiod.h          | 17 ++++++++++++++
>  lib/internal.c           | 38 ++++++++++++++++++++++++------
>  lib/internal.h           |  1 +
>  lib/line-request.c       |  9 +++++++
>  tests/tests-edge-event.c | 51 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 109 insertions(+), 7 deletions(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index d86c6ac..cbc83f9 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -1176,6 +1176,23 @@ int gpiod_line_request_get_fd(struct gpiod_line_re=
quest *request);
>  int gpiod_line_request_wait_edge_events(struct gpiod_line_request *reque=
st,
>  					int64_t timeout_ns);
> =20
> +/**
> + * @brief Wait for edge events on any of the requested lines or a
> + *        POLLHUP/POLLERR event on the given file descriptor.
> + * @param request GPIO line request.
> + * @param fd file descriptor from any I/O, channel, fifo, or pipe.
> + * @param timeout_ns Wait time limit in nanoseconds. If set to 0, the fu=
nction
> + *                   returns immediately. If set to a negative number, t=
he
> + *                   function blocks indefinitely until an event becomes
> + *                   available.
> + * @return 0 if wait timed out, -1 if an error occurred, 1 if an event i=
s
> + *         pending, 2 if the file descriptor raised an event.
> + *
> + * Lines must have edge detection set for edge events to be emitted.
> + * By default edge detection is disabled.
> + */
> +int gpiod_line_request_wait_edge_events_or(struct gpiod_line_request *re=
quest,
> +					int fd, int64_t timeout_ns);

This sounds like an oddly specific API... I wonder, why does
gpiod_line_request_get_fd [1] + doing the polling in your code not work
for you? Since you already got a file descriptor for the notification
that seems like little extra work. Or did you consider that but find it
too verbose?

[1] https://libgpiod.readthedocs.io/en/latest/group__line__request.html#ga5=
c0dbdcd8608b76e77b78bca9a6b03d7

- Erik

