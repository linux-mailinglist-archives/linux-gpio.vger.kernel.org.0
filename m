Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1592E77141D
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Aug 2023 11:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjHFJOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Aug 2023 05:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHFJOR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Aug 2023 05:14:17 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E52A1BF9
        for <linux-gpio@vger.kernel.org>; Sun,  6 Aug 2023 02:14:16 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5232bb5e47bso1059050a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Aug 2023 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691313254; x=1691918054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syma35n+eWRyynIxJqBNp1WwEXAnz4VBVdvUyca+dt8=;
        b=AhYB6iMJAUuA+EDNRTDISMD17+87r324v7lEFje/VURRfDs0G7zNhw7EWprS44Iu+t
         75UkuKBraAT697t65755HqK5Cu0QPcnks1b4sRc2kkd5Auyq6oOgj8PDqKNoUIrsYfA4
         Pb3HFqFgY5UZJsYDsW4aZRwl4fswQBKF5yOfDr7r14vSY66OTmwUGDb4rWGoqTVoy8mz
         pkZ4oIms/TFVfFOZ4+l1Gj5Q7tj/dAWdVdos9j7G5lcOYrb6tgC7FnN4dN+RxKps+7R3
         Ussntdy1kMpmHirJ5ucE4xwpvcoHuRmbTti0j6errufArSNDBIAfHOS7OIRZBn2eeurd
         nm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691313254; x=1691918054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syma35n+eWRyynIxJqBNp1WwEXAnz4VBVdvUyca+dt8=;
        b=M3TTq/UzOrqEtjoSAOo3VlChgE4bW1Ec32j0IT4hixoX9sAAKg45B+I363EnWxFKza
         S9TkEYlR3JipGRlagSJKT01A2r2kzJRZMfrmrBs4+KKsXKylsuYJIS1Ty2zZsfBKmfJ8
         4jCfpkhj3teSDtpHVhq8KgP8ED/zCzOLzeBGhzfwhHUKEOHj0weqM0DX4ZyMyQ+eNo6f
         JgHdOc5p+228Y/qjSFIStscVr4ENRC8j+Rff5wvhungFXaSrKbupEX5+4ReWLGZmqh57
         2vbHq/JxhnHP3KO4pPbtYUOeUJ4fo44dx3hZFVbaadJGEk/SycBqUR7WyY36ZvsIil5m
         OHxA==
X-Gm-Message-State: AOJu0YxuyMziBwZ4NFCNTy4dPr6/pWhMQVvmMxQZBIVCej36TroMZcjs
        XCh9+EDQCMs8He9mDjlVfKtbUas7LvvoqjXR+jNdiPGj
X-Google-Smtp-Source: AGHT+IF6XsENE8H9UeI+lw6c248jLkKylsbEuEHhea0FO3Py12qej4MHAEDqfwywTqdSHCougKIIJqY9aQBRj8aQPXw=
X-Received: by 2002:a05:6402:b12:b0:523:1004:1c9a with SMTP id
 bm18-20020a0564020b1200b0052310041c9amr4558860edb.35.1691313254235; Sun, 06
 Aug 2023 02:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol> <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol> <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol> <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol>
In-Reply-To: <ZM7xEbr0essN2qY3@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Sun, 6 Aug 2023 10:13:38 +0100
Message-ID: <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 6 Aug 2023 at 02:02, Kent Gibson <warthog618@gmail.com> wrote:

> And I maintain that the wrong path here is to use v1, rather than v2.
> So v2 is absolutely not an option?

Not unless it is available as an automatically installable dependency
of our package, no.
Which effectively means that it needs to be a package included in
current Debian.

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
