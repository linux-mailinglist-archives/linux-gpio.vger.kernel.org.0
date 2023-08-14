Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0460677C36A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 00:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjHNW0P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 18:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233313AbjHNWZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 18:25:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB401719
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 15:25:56 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99c4923195dso657394866b.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692051955; x=1692656755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74CUQEhcIjap1qoznhIVGJJ21zZt8QrTJrQ/Qqd9ymo=;
        b=foEOcXqc4PqiDCIYUmKzOBj02TipUWmFV7o7z0cL9zWOLKbYEh2xjnXFxD9cvsjiA0
         oIRTn92WuDh+N4NILa60LnfkMSbnUbQMw9A5ReiBLmw0tbNfMjy/o5maPPL99cOEukPl
         KGRAO9Z+qIirhgvpbY3Y0cQB6Ogooi3rKTTYGxmIzjH+gd8aFficvyuoZ1854UScCIhd
         v1OIPnzczP1rrzth1BLeqXnvZETS09w6+WyKlDlRN5ErKfzmvjpoy/XlcgKn2fJq3K72
         wDTnhHNdKbGl2ZC2YvE11iB60ycwMMhvJR1xxxxkQ7j1BssTQlUYUbaX3U7ICyCEDBRv
         Ebew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692051955; x=1692656755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74CUQEhcIjap1qoznhIVGJJ21zZt8QrTJrQ/Qqd9ymo=;
        b=KhklSTk9FIuZy5q6/aySzqDMZMh8QcQYvxWh6jRABLEFCJ56RwDi17a7LxsOb5HRyV
         vvM5RpqpUQMYtzVN236UIPBSGkckqy4PnsBJy0Q1kn9hcKW095yq4rnyp493eI9unUGF
         2fZBjwARaRfJJDd8ODdbMIAfnnK05yCbB5J9i7DsCLRaZkLGsaNaeiIXa1raj8aUERlH
         /SZiW9IviZD6ZUBkj8OC3Lin+yllt8Sw1vGX8ECrcCzOCTk3lMMe8dvVZixYHEe8nhMa
         RtKJfT/WniRMrYH22jO52CqWHZJAcp8SksWuHFblTspOATLce5DrAcDBs6dOeEX09R5G
         gFZw==
X-Gm-Message-State: AOJu0YzstsA+pcVQlzK26iwFNfbWDRuMLlAYgsqA2mK1f4yF1zyiBPQl
        E0NNXvFqK6F0xl8xz48Kk8P4KA6lJTm+ub8+LKR2FK8mm2c=
X-Google-Smtp-Source: AGHT+IH4XCVV9kH+t6hwB1Kat+DZJVChdNJF16V61S0Ea6BMxuSOtlKZw+UkPH+5I63zz8zrxt7utK50jQpOTUwrd90=
X-Received: by 2002:a17:906:5391:b0:993:f2c2:750b with SMTP id
 g17-20020a170906539100b00993f2c2750bmr8386683ejo.17.1692051954546; Mon, 14
 Aug 2023 15:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <ZMRzYD6wGYywiPbd@sol> <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol> <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol> <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
 <ZNQzT2MtskTTZTiI@sol> <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
 <ZNWH+L9o5gp6PWyq@sol> <CAN1+YZWTJ-TqjR99MBGSPPmQY1ao-TCGu-DfNTYBQvbXcmV=5A@mail.gmail.com>
 <ZNWQsabr8kPCbD4X@sol>
In-Reply-To: <ZNWQsabr8kPCbD4X@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Mon, 14 Aug 2023 23:25:18 +0100
Message-ID: <CAN1+YZUtCp1FLUSTGJthpXt1q7=2seYFiEHTb3-pMarpk0DnOA@mail.gmail.com>
Subject: How to use gpiod_line_set_flags
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

I am somewhat puzzled by an error report when I try to use the
function =E2=80=98gpiod_line_set_flags=E2=80=99

 warning: implicit declaration of function =E2=80=98gpiod_line_set_flags=E2=
=80=99

Many other function calls in the same code are working just fine.
gpiod_line_set_flags() appears as a function declaration in the header
file looking just like the ones that do work (as far as I can tell)

At the moment I have the code commented out, but I was hoping to be
able to use the flags to control pull-up and pull-down.

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
