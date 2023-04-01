Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FE46D2C14
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Apr 2023 02:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbjDAA0N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 20:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbjDAA0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 20:26:12 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780D31D2ED
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 17:26:11 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id v5so9818754ilj.4
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 17:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680308771;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mk2nPyPDHF2nSoHYsdcPx4I1t1gE9idID2faOY4LJU=;
        b=m0ajyKWbiBsQi+yyaFeDz/LekS7o8eGnHuyLrqrWzF0DfDtB9TLUsx+koS0AjcxEl9
         n6JTDwucfctUVgPNSLqFa4LqbhZaSdqDYQTPHA9GxPgJcFRoL4ArKup34dd8wQz832Wu
         2isTIOo6nS/a0jcSJZbAVM+7vvjDJV+HXPXz8Vo5j538pJDsgWCCOANzDsA3ex0Fla8B
         rCRipNZkVZRX1K2FsMNhrWLFL8cwJhKaS5VgU2fRyZAVPtF88SV+maYua6tIqXYnW/8k
         iRyFeXM46PkemDKdV5BjQ1fdYL3uk1Z/rHU3c/RjxyjVpmaGB0f97v5AubCz0Ct6123w
         N+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680308771;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mk2nPyPDHF2nSoHYsdcPx4I1t1gE9idID2faOY4LJU=;
        b=TTT4tGQWiNGW5r+3jepuLhhcHp8hAzfDKP8GkLGPHlYVNDyNebpLwaJpR+2j8GIH7E
         Eb99INhkY7ZVeA6a6JvL56Od1nfzgewb5yLCXKnwODn1tCIDhu87iCXyeHZdx79EwGFf
         VciM6CNwtNK1OPttziyX41aojuCiDEVELVZmSHLpzzovKS2xLwXvaRoVwdvwngkdfHAh
         L748XKxFh2+hzbNSsEu6rzGmHDucLpEkUyv4aKb+pJXmE/0oL8m4QuoXqtIg9bNJcbVF
         fo/HuvAc3Zq8g3Yf1jmPERAWixZjOh/Xh+0FDJ3p9Ne/hHZy8LcsxDz3Wi7dDGaOiqDL
         yBvw==
X-Gm-Message-State: AAQBX9eEjikjNWFxxQUlS6ZgCnplnpYi9tE3q2NNTiz7j275p8MWt9Jt
        ESrbt7WHYBbkr9DG2GKcw+V5eY98W+COIRR8Uqg=
X-Google-Smtp-Source: AKy350aUUatv9USo+GLWE0R5Db4InEQ8FHyjW5YFVynnQRkX0fZbVcGyKJTRBVnZ/jP/LD9w0MOP2MoDjxBnl/ijkvE=
X-Received: by 2002:a92:cda3:0:b0:326:3f06:a0d7 with SMTP id
 g3-20020a92cda3000000b003263f06a0d7mr3672994ild.0.1680308770905; Fri, 31 Mar
 2023 17:26:10 -0700 (PDT)
MIME-Version: 1.0
Sender: samanpyabalo@gmail.com
Received: by 2002:a02:cf2d:0:b0:404:a526:7a9a with HTTP; Fri, 31 Mar 2023
 17:26:10 -0700 (PDT)
From:   Miss Katie <Katiehiggins302@gmail.com>
Date:   Sat, 1 Apr 2023 00:26:10 +0000
X-Google-Sender-Auth: WuRBnijy9fCcJAq2-UPWB2Q3aDM
Message-ID: <CAMbVUx65en446=mFMvR9m6P7orJE_Hs+Evm3ud1dZeSzmLDCmw@mail.gmail.com>
Subject: Re: Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hej,

Modtog du min tidligere besked? Jeg kontaktede dig f=C3=B8r, men beskeden
kom ikke tilbage, s=C3=A5 jeg besluttede at skrive igen. Bekr=C3=A6ft venli=
gst,
om du modtager dette, s=C3=A5 jeg kan forts=C3=A6tte,

venter p=C3=A5 dit svar.

Med venlig hilsen
Fr=C3=B8ken Katie
