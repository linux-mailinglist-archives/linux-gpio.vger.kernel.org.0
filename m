Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77EE7660FF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 03:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjG1BIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 21:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbjG1BI3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 21:08:29 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BAB35BF
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 18:08:18 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-76731802203so129319685a.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 18:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690506497; x=1691111297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlVTNbepcYNNY3ZleC7mgBUq9w9sGh7jypvmFp8WhBE=;
        b=cYwrCitzzGKjBVOAsKIBJmaYIdHaQvXsCBNzoj7Z12UnR5xyjVV8nzge9PTk6UmD12
         IyuzXpzu4WP2s7R05yKFc/mGlRYR7a0sP4Ml8IKz4+wOR+7g/N13JEUiP+aKvrm+Q+C6
         iVMeLCBpRRZbGvu4vaDYxLCt9oJECy0BM+zIVGxjF5aZ8hJ0EeB9z8b9376/EO9p+35K
         TxIv1DRr5PrDqrq69kRDJ2L+xW95enLiKB9sdBU3VPk+FVUfoGmamFO0n8OBrqJWaeQP
         uNNx8F0QhqjJfuQhL4uAVBAGLnoZDaDouiqutmxL2chghp93qN4pukRNpCLbYsU+DPly
         qI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690506497; x=1691111297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlVTNbepcYNNY3ZleC7mgBUq9w9sGh7jypvmFp8WhBE=;
        b=Oe6VlqSsV3lNLWNycwlSJjWHqgeZ47qReBrdQ92yeIi6Dd92AXt+UdBvsul9QsOFYe
         nmI7F8YSCDzYgo9WQA1vqtKHO4fxk8Mj4rX2EV0jxjroLrWN4sYyF53PnP1XKSXkClNC
         JXmo+n17kIPvtLbitFbBtRpjXsbuWqircprABhYuVWgBMryPgq61SKj+Pukqdf+fZye/
         VYxdTbYM4ithxOqQvGdJAsyUbj7UVi5XsiWT4x+slq2v2Bp0cKvCsfiRkLP2Zvd8F+Fy
         WGwvKs7nYSueqnhEMtq3yqj4pbfs/MIb+4ww0rIN6UyE+ItJ7CXWsgPSPoTPNs5ekZ/a
         tRuw==
X-Gm-Message-State: ABy/qLYPkl6MQSAgQL9CgNWDwZld4Yf10+hL8M0D2RT+1GfDFFxVITHC
        IC2GrpgZS0hGci2DSHqIzJMFri9jnnILEMB+2hY=
X-Google-Smtp-Source: APBJJlFvkxb2aEwnc9rwXWYJP4xF0qsAPJK6Q1J+rr94HFyQw59qYuvqDABpQ0c6p8EvJ2gpgq+ZNOQzosqL71dGA18=
X-Received: by 2002:a05:622a:1906:b0:404:132b:f8a6 with SMTP id
 w6-20020a05622a190600b00404132bf8a6mr1723443qtc.26.1690506497203; Thu, 27 Jul
 2023 18:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol> <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
In-Reply-To: <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Fri, 28 Jul 2023 02:07:40 +0100
Message-ID: <CAN1+YZUJwbK0oUWET6_GkWxVpd-VdwwOh8FCNsApc3NF0JAknw@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> line0 (null) line1 (null) line2 (null)
> Error =3D Invalid argument (22)
> a.out: test.c:47: main: Assertion `retval =3D=3D 0' failed.
> Aborted

In case it matters. Raspberry Pi400
Debian 12 for Pi4 downloaded from: https://raspi.debian.net/daily-images/ t=
oday.

files compiled with

gcc test.c -lgpiod


--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
