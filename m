Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122E36834C7
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 19:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjAaSJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 13:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjAaSJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 13:09:22 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C691B54D
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 10:09:21 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id p10so12502789vsu.5
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 10:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nd3rnQKvQdyAwKsT+GUkd8tOiS36MQWuUnO0Iz/mmNw=;
        b=CkgnWq4FumOF+VqNSEZf4xOyxPZ0fZONV9wPG/oLThzcfXbfMfHp2WF8b0SjLyCwhH
         7vBcwL+/W/6EKrSAhH1hRsqlXkiiJ+ddQAqsCdkhHvKDrNzvO1MBo3COkxkpDbH+h+4t
         vSmwdlASUAnkjeYxGdukjHujugnMzZ178CEkA/DYkolaYWrwO1/RUlYrnHFmAGHqBVdM
         xU31wJhhUFwqWcLV8r2s7E7oztnc3q1BsihSfJecjD2q/eYV7SuvlW3wKzSzhgaU7g2O
         nZq+OtMbfGos9XSBrFxwupEdnOeHqHBwlXi7SELzb9mgc6pi0adJE8gJQIQBP9Gu6UJw
         LTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nd3rnQKvQdyAwKsT+GUkd8tOiS36MQWuUnO0Iz/mmNw=;
        b=pfYYDQFtTna91YbMZK4eMSRgzg/ZnyofigD9jlJBPKJf4wFh0xwtpkUjtT1riAWdj/
         CLrbErcjLplLE53vXlpb4B4OV2CRJuKjng+HihtELfT8DdF6Rka0x0iUpxHTRv5ia0yR
         e0jLQTTEPKeQtE7l0l+lruo2eoGPLYjXg9j5aRx3JmKKoggBexwWN6WZ9atDK1ntBhAS
         PRdq8ePtB6sRlQhzqQkpU6mbwmTIhIKoviayXTLaaNEokWGOy3aqYyjih9aOxtavskBU
         DZOlAYbWbrGfZQafnW9i6Gw/4eF9WwTQLxIp2Q2eIbQ4tCY3s+H6TXnQQ2Ak+cuHywhx
         +VMw==
X-Gm-Message-State: AO0yUKVra+cqQ55JtTKPsMrx1q8Habyhu5vUmoFPCywFHOIINW/euIVj
        V2u7YcZ51Fkso6gdwtOE/ZFaVSmuuDEOkV+AmgP5GIsFSXq6CxoV
X-Google-Smtp-Source: AK7set9So0Y3Umkil4SYk+rmDExI0I9H4ApA7vqyOcFLQh5sz2XnaE8zPt+HAaXg5MYFI5d5Ynm+5mouECSYvFsMIVI=
X-Received: by 2002:a05:6102:10c1:b0:3f2:58c2:5358 with SMTP id
 t1-20020a05610210c100b003f258c25358mr2042806vsr.62.1675188560534; Tue, 31 Jan
 2023 10:09:20 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR10MB2908B13E4387EAA786CF5F0FF9C59@DM6PR10MB2908.namprd10.prod.outlook.com>
In-Reply-To: <DM6PR10MB2908B13E4387EAA786CF5F0FF9C59@DM6PR10MB2908.namprd10.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 31 Jan 2023 19:09:09 +0100
Message-ID: <CAMRc=MczAuqzah37Jf7k3MdvNwWzhcnELWcATUA-yFMZ1L2d8g@mail.gmail.com>
Subject: Re: libgpiod multichip bulk event wait
To:     "Naidoo, Vernon" <Vernon.Naidoo@hidglobal.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 20, 2023 at 3:06 PM Naidoo, Vernon
<Vernon.Naidoo@hidglobal.com> wrote:
>
> Good day,
>
> I'm porting some code that currently uses the gpiod_line_event_wait_bulk command, however, the new platform has the gpio spread out across multiple gpiochips. Is there a way to achieve the same functionality when waiting for events on multiple gpiochips?
>
> Best Regards,
> Vernon Naidoo

You can get the associated file descriptor for each line with
gpiod_line_event_get_fd() and poll all of them together using poll,
select, epoll, etc.

Bart
