Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384F05B2008
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 16:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiIHODX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 10:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiIHODV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 10:03:21 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4698C462
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 07:03:18 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id ml1so7022924qvb.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date;
        bh=zdRRrOYsheHEiqXbG/ac/5ZW26Zos6Yr2Z60sFlKj+E=;
        b=oBdHMZlgLcONwLkUbQRGTFiTjwDgWefQIUyhkL8eIh2dBP9j7FDYgc5p3z5Hfr4zlj
         6umyKp8Yfpz4sGNvQzSR2nF2NxDfO3JCRN5aANRDtfJN+IPtpsOnoACXqkCKQpp7GyOR
         gmCw7YsKHJxHsNOEbUJNaDfnxK4Ao1IKI41M89ydPbwb3EgTfxmQ3j1/qy5pZ1YPXD1v
         fFrwGggF3wAMn7JBzQdaSHeDweuVKvvPXwsUUy6nl+GpIq8lNDEy6bZwDuLc9TopRoBG
         HXE3s7tWRp3Ctbaf9+G8j5UeGD8F2mE4hrK9xe4Gy86yPUs+ERyDcvz5LfCZcMwX4lsI
         P1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zdRRrOYsheHEiqXbG/ac/5ZW26Zos6Yr2Z60sFlKj+E=;
        b=r7oqM5Rp/FpTRQgj1bJ9c9l8FnrEjFUZZjL9C0x1Xx3P7BpRrRypfMmJ98n2bwFhDi
         c4iO0sIjcPMw3l0FVZBwlOzd2tCUJptHAhh4X/xebKPss/hspx8powpood7K6PrOlcJi
         xtEy3ZUGiNiNdhUJCKGYFkAq5S/xq1AoB24TZRg8ufNecNiXwMEf5HfFejE4BodReIff
         /f9DIaqssI01y3LgPYSmj3p9cPms9uJrbfAAtZwNwBDU26RVES0wUoWkn4x7PMppfu/5
         ePrJv1Uf617HWZI5qTCZaeM5wO/RQj9ToZdAtvlVOh3Wss0Rf4HXp57stYtOwjx/4CWq
         ZA3w==
X-Gm-Message-State: ACgBeo3FVLrmA1LPJhuaZUSRsZk67MfQ5V27mrmspHeTy1E9zPj+njRZ
        MnLzk2hByJr5GU/q880pTE2Q64DUpEY=
X-Google-Smtp-Source: AA6agR5NZ6hgDy5hCpfWlk8b04DHIDxJuKtx3/uOy4ISb1Em4+jXeMM8jt+HaA2zF9d9y4gu8r2YdQ==
X-Received: by 2002:a05:6214:19c7:b0:4a6:765e:d2fd with SMTP id j7-20020a05621419c700b004a6765ed2fdmr7437122qvc.72.1662645796903;
        Thu, 08 Sep 2022 07:03:16 -0700 (PDT)
Received: from asus.cpetrescu.net (cpe-98-10-48-140.rochester.res.rr.com. [98.10.48.140])
        by smtp.gmail.com with ESMTPSA id d16-20020ac86150000000b0033a5048464fsm15521732qtm.11.2022.09.08.07.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:03:14 -0700 (PDT)
Message-ID: <e8bf314dd0edfd0709d71e85fb8d877c3722e33e.camel@gmail.com>
Subject: [PATCH] tools: Change asprintf return code check
From:   Catalin Petrescu <catalin.petrescu@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 08 Sep 2022 10:03:13 -0400
Content-Type: multipart/mixed; boundary="=-E0XEHrYQaWQKhjXqD5H7"
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-E0XEHrYQaWQKhjXqD5H7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there,

I found a small error (IMHO) in libgpiod.
The issue is that asprintf may return -1 if it fails to allocate
memory, and if that happens, chip_open_by_number will pass a NULL
pointer to gpiod_chip_open.

I hope this helps.

Thanks,

Catalin.

--=-E0XEHrYQaWQKhjXqD5H7
Content-Disposition: attachment; filename="0001-tools-Change-asprintf-return-code-check.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-tools-Change-asprintf-return-code-check.patch";
	charset="UTF-8"

RnJvbSBlOTJiNzFkZjNjOWY4MzA0YTkxZTBkYmUwMDk0NjE0ZGYzNzg0OTQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDYXRhbGluIFBldHJlc2N1IDxjYXRhbGluLnBldHJlc2N1QGdt
YWlsLmNvbT4KRGF0ZTogVHVlLCA2IFNlcCAyMDIyIDE5OjA3OjI1IC0wNDAwClN1YmplY3Q6IFtQ
QVRDSF0gdG9vbHM6IENoYW5nZSBhc3ByaW50ZiByZXR1cm4gY29kZSBjaGVjawoKQXNwcmludGYg
bWF5IHJldHVybiBuZWdhdGl2ZSBudW1iZXJzIGluIHNvbWUgY2FzZXMgKGZhaWx1cmUgdG8gYWxs
b2NhdGUKbWVtb3J5LCBmb3IgZXhhbXBsZSkuClRyZWF0IG5lZ2F0aXZlIHZhbHVlcyBhcyBlcnJv
cnMuCi0tLQogdG9vbHMvdG9vbHMtY29tbW9uLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy90b29scy1jb21t
b24uYyBiL3Rvb2xzL3Rvb2xzLWNvbW1vbi5jCmluZGV4IDgwMDg3ZWUuLjg1MjFjOTMgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3Rvb2xzLWNvbW1vbi5jCisrKyBiL3Rvb2xzL3Rvb2xzLWNvbW1vbi5jCkBA
IC0xMzcsNyArMTM3LDcgQEAgc3RhdGljIHN0cnVjdCBncGlvZF9jaGlwICpjaGlwX29wZW5fYnlf
bnVtYmVyKHVuc2lnbmVkIGludCBudW0pCiAJaW50IHJldDsKIAogCXJldCA9IGFzcHJpbnRmKCZw
YXRoLCAiL2Rldi9ncGlvY2hpcCV1IiwgbnVtKTsKLQlpZiAoIXJldCkKKwlpZiAocmV0IDw9IDAp
CiAJCXJldHVybiBOVUxMOwogCiAJY2hpcCA9IGdwaW9kX2NoaXBfb3BlbihwYXRoKTsKLS0gCjIu
MzQuMQoK


--=-E0XEHrYQaWQKhjXqD5H7--
