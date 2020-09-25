Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B0A278C4D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 17:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgIYPOI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 11:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbgIYPOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 11:14:07 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38C6C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2020 08:14:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id y14so2825118pgf.12
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2020 08:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=3ESMbYgkZehDtre/X3JHJVKowL5dmR4t1Rv1A2qb8aU=;
        b=dPh8xY8MHR0yvAOx0ry1NlksgkVje8DTaZ0XlZoSkT2DTKIKpd2BqZ+NS1LMRP1D86
         rG99CoQNOXhVA2IKWUYgwZaSPJ0CEjISK0zCb0PaLkMx92YwzuAigLMMn3MkBb9T/atU
         amCg/v4ULhPEWVbTzJ8lszBvwcE7//bYkN0eEpCYKL5nA8aWHetA9en7HpEcsIUAhhLF
         Kqh2zH1TSlKWxsyDtGCt9riZfcm0NhzOtf/NvugE8NWHlx0RtuiEO2wMuGLQzSPx2yDn
         vc+jF1LfC25vvx928wCRwEjFs3VkZv9uPigBthbPWsn95mrqkLI4i11UktyFce8C6Ghv
         c27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=3ESMbYgkZehDtre/X3JHJVKowL5dmR4t1Rv1A2qb8aU=;
        b=ZosIWBYPIVLJ/DB9RIRL6amRXJIz2QjjBRl5QlEiUqerNP6oPpf1sRFw8rAYc/OPrr
         D7x5t6+NFiqXsbN3ud3uz5sG/XinQS7Z+aG4y5NDNOAR6OreVHuiEZuYv84Y4WwLKHwP
         maDQg/OqeL7xLCKI/8w/ugnFapexvbwRrLB0EhlIsXM1r//t7dwDf9+XIOqFWnfz5cHT
         IAskcJHdl99A/bZ2PwPzRpYWhAsRAvTrutpvVVKbTq/u+YafVbp7Oh95eJZ9VAzKw7oF
         8KJ6zNaN9E/+BK6nAijcZi1Alv+NfHPo40MKMuFJZuBbGGXOit6UfbfqYdUfktsVpvLn
         NQgw==
X-Gm-Message-State: AOAM530B06eQW06rTu6bYa0ZD9bCTdbpzlIr6tVOCyqu+v4dwgXl74M7
        DILK9TuIOW/0xO3lGY5YNhfqcmH1ihLuSJFeC/s=
X-Google-Smtp-Source: ABdhPJze5v7B1gBfvzanB6Xku1xNH71WwHjBdxmprc74cnBEqPeuhId5m9xD7u+KwISqwh3/yONfeTuJ6sJPLRLHeLE=
X-Received: by 2002:a62:e20a:0:b029:13c:1611:6535 with SMTP id
 a10-20020a62e20a0000b029013c16116535mr4447325pfi.7.1601046847409; Fri, 25 Sep
 2020 08:14:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:95b1:0:0:0:0 with HTTP; Fri, 25 Sep 2020 08:14:06
 -0700 (PDT)
Reply-To: julianmarshalls@yahoo.com
From:   Barr Julian Marshall <baranthony50@gmail.com>
Date:   Fri, 25 Sep 2020 08:14:06 -0700
Message-ID: <CABfKVN8TRRKi27nh1Frsrkxm=Xs2YAOHgBPRhLBb510UMYGX1w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rozhodl jsem se v=C3=A1s kontaktovat z d=C5=AFvodu nal=C3=A9havosti spojen=
=C3=A9 s touto
ot=C3=A1zkou, jsem Julian Marshall, advok=C3=A1t. Osobn=C4=9B jsem zmocn=C4=
=9Bncem Dr.
Edwin, kter=C3=BD byl =C5=A1iroce zn=C3=A1m=C3=BDm nez=C3=A1visl=C3=BDm dod=
avatelem zde v Lome Togo,
kter=C3=BD zem=C5=99el se svou =C5=BEenou a jedinou dcerou p=C5=99i autoneh=
od=C4=9B.
Kontaktoval jsem v=C3=A1s, abych v=C3=A1m pomohl s repatriac=C3=AD majetku =
fondu Dva
miliony p=C4=9Bt set tis=C3=ADc dolar=C5=AF na v=C3=A1=C5=A1 =C3=BA=C4=8Det=
. Pro v=C3=ADce informac=C3=AD ohledn=C4=9B
t=C3=A9to z=C3=A1le=C5=BEitosti m=C4=9B pros=C3=ADm kontaktujte.
