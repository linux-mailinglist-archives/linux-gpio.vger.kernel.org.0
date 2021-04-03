Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB0E35334F
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Apr 2021 11:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbhDCJlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Apr 2021 05:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhDCJlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Apr 2021 05:41:39 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B103C0613E6
        for <linux-gpio@vger.kernel.org>; Sat,  3 Apr 2021 02:41:37 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id v25so7108074oic.5
        for <linux-gpio@vger.kernel.org>; Sat, 03 Apr 2021 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=iH6H+KsbgHJDYOcY4RDCEAjB+TCIWIxmD7AcRrdLf3E=;
        b=Bz4qwpXbE7rAbjQ588+cIIYU517Xo5r89byC1sVcY5QJpSZ2w0vyg1brY6Ehmkg1y3
         cgn3nGblBxUImJQfBND70U2OpDy39fYKlI5HVFro14m9ZXOP3EY8uj5S4xFxmZ2DdktE
         hGFXBEF4csBzWR18bgL0D1CN+68qHmVJ/iDJOrLc8u15ZdkOGAUHo+Rqcxa+gSK1U2mB
         JgU/cPuPJdVuM6GPG8i+tkaAqKBYQUuCx2sNMrDDEdPgcVyiDiRmqmNMk7BgMESNBqEY
         AzdDIrFD9Zq3+0Bg2vG6wqwkZx8XDIkaUs48UK9ksJLCsg6V/OGayjQVLlGhMVR4Qc2w
         RrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=iH6H+KsbgHJDYOcY4RDCEAjB+TCIWIxmD7AcRrdLf3E=;
        b=mVx5eNy7MaLPzLgLNQI2s5U58uFEnFfPcUXH2ljELZDg54T1nT1XP182V+oK9/Gv2Y
         8AtrLoPtbzWoifFAFrAaFw7ZMfj+sswWWY6fWBNgSGWZm6syqQSHp+1/A0byK5VO15S3
         4JA5a7/TI7CpFKFT5hUJB6/7DkVbtJmZhRDAYGOPEfB212mieNwKThKGnthPQojkykFG
         aQCH2G+HHng5N31F5GviIds4T1QiG0SnEM2kCfi/A5XvqWqtYHAXidgngjyw1RFXPvPh
         gxjCB9lF6kT+qsLvY6iEu/e8yxa9pgqkyY3mIEqdbgEq0y91OE54a3ieivU5oWcycOwZ
         cCsg==
X-Gm-Message-State: AOAM530+NUoCLaDur1qwUX6FmdFJx1EpMdExQWxCqXeS681fndUwQ4pd
        Ous/GJ1e2ixf3eXUdhokXU6yrY1ESd2CqmvlPX0=
X-Google-Smtp-Source: ABdhPJyTfo5AajBg5CUqgKjYELSadOy9QpHx75+8GMFzdH5MyqbyoAplneMYwLl8sIkmfrdBVVjBIM/xhHqFt3PU2I0=
X-Received: by 2002:a05:6808:13d0:: with SMTP id d16mr12827460oiw.169.1617442896674;
 Sat, 03 Apr 2021 02:41:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:96b3:0:0:0:0:0 with HTTP; Sat, 3 Apr 2021 02:41:36 -0700 (PDT)
Reply-To: fionahill578@gmail.com
From:   Fiona Hill <markwillson064@gmail.com>
Date:   Sat, 3 Apr 2021 10:41:36 +0100
Message-ID: <CAEzv2VY7i_iFccBrwANDOdDKUf=z1fnTNq7rHjeYZmQ_e756oA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Attention did you received my message?
