Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183C07E6AD2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Nov 2023 13:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjKIMuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Nov 2023 07:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjKIMuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Nov 2023 07:50:17 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B052D72
        for <linux-gpio@vger.kernel.org>; Thu,  9 Nov 2023 04:50:15 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a81ab75f21so9743647b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Nov 2023 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699534214; x=1700139014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9QkNEZK+idQ7+J77TT5hbKke59G7z1CkfstDJ5u5Ow=;
        b=w9AnDqTsv5FtyKNGv0IcsRhz0Vf18JSgYz8Oe1wFWCn8lyzx1cHb9z1vWtJqR+O6jw
         oHHWXYMsleKbg3ws+vBJZUc7BsmDzBdkuWvkF0v9lvvnRBiHN5RjTkJJVwKgJTFgYj/O
         9w/tRgrNe1Z5Ckm6wwBJ1PmPWQHC+scCoSyvD95DHqNOFRbL8FLE+UdMFWRAKiD6LskQ
         HNkxziP6vf3IrdZRAratOGPjYI1LoO4lBqBGAHW7GeA6cTJfntcKUuOndJxXWS6EdlZ3
         Rpao/nOnk8RykeyVemNr8wh8wJADNfJbdlZRzQfg7KGT7aD0MFb7AhpdF36SOn0P6kQ8
         gPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699534214; x=1700139014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9QkNEZK+idQ7+J77TT5hbKke59G7z1CkfstDJ5u5Ow=;
        b=JfsY76NUIAod6RpgIHGFG5lxLfIX4ErDx2J+E2VbUegMxjwAvXuGnrhdqCqUi2c8OE
         iXM9dvfNN5rPYst1FdwwstJE23AUYzd9dXKQdh8HABAF3YgA0Z7kLHKNv1nDIeExlrMH
         mT9z92gMvHdEDWE++3w+4pbwgMqqi8FWvsXX2FZn+q/iyABMdjtiNus+GyycC2FaEWkf
         /zwJscbzn3fOlrTMrVyLN/EFUQEKGiLhh6guxhEH0GQF77328G4UTtv5o71heJhup7gs
         BXsVdSiIWPoy8IWV11BbwTMm3p9TI4oJkmMf639sAdoNckESlXBpClP3VE3ZumKNP2me
         a/9Q==
X-Gm-Message-State: AOJu0YyULjbT66HrQeRz5QUuEGB9KF9mxNvUqrD+k8zPeCc+goCt1+dZ
        BjAlU5y7tfZJWDkzsLcWPHpS6oBEqa0g8SrxKE/v5A==
X-Google-Smtp-Source: AGHT+IHp+SM2yGUTokG4IzIbO8fHH9Otm9D7ZLbf1ZTxB+cIiqKlz50s1PbdFXn6HFqQ5ZgJs+2kLuirk/PMOgI3A34=
X-Received: by 2002:a0d:f3c2:0:b0:59b:54b5:7d66 with SMTP id
 c185-20020a0df3c2000000b0059b54b57d66mr4948891ywf.34.1699534214575; Thu, 09
 Nov 2023 04:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20231109085419.84948-1-heminhong@kylinos.cn> <ZUzSM37FWz6sgH9n@rigel>
In-Reply-To: <ZUzSM37FWz6sgH9n@rigel>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Nov 2023 13:50:02 +0100
Message-ID: <CACRpkdZfTbrPLFGH5akY=od8Rma=2c6F=nPz2nmAz2my_f7OeQ@mail.gmail.com>
Subject: Re: [PATCH] tools/gpio: prevent resource leak
To:     Kent Gibson <warthog618@gmail.com>
Cc:     heminhong <heminhong@kylinos.cn>, brgl@bgdev.pl, andy@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 9, 2023 at 1:36=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
> On Thu, Nov 09, 2023 at 04:54:19PM +0800, heminhong wrote:

> > In the main() function, the open() function is used to open the file.
> > When the file is successfully opened, fd is used to interact with the f=
ile,
> > but the fd is not closed, it will cause resource leak.
>
> All open files are automatically closed when a process exits.
> That includes both those returned by open() and by the GPIO ioctls.
> So explicitly closing them here before exiting is redundant.

Yup. And this is one of the reasons why we have the character device
in the first place.

The character device gets released and all GPIOs are released
if the program crashes.

You can imagine what happens with the sysfs ABI if a bash
script crashes halfway through some complex allocating and
banging GPIOs left and right. Not good at all.

Yours,
Linus Walleij
