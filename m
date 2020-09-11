Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59385265E69
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 12:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgIKK7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 06:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKK67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 06:58:59 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403A0C061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 03:58:58 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id x8so6121079ybm.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 03:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=GubrMrhiQBFWJBN2XcahtUhKA2h3c2cQmbRbLm9sXaE=;
        b=pceSNezmaZvBJ/8opyiqUm7OUAdURwXrQMfBdp+qZsfqCXbf8UnEUCVj4yzgdwTwdJ
         FpUDD2uTMCL11VnL2rVEQwRhC5hK0tx/Won1Ga36TiXRXr17vzrpdxRDkwwR9OtOMEiA
         XKh2OjSuUwZH9dL2CoOrVitT75enEaxn18LgtwpT8LRUfxGVcaBcRkcnD5ruAxyzgZqd
         Pz7QJUZMf6KygApgp/kyA76vM9rIb6R6OL7i4qHycmeca89Gwtzve/uB+g4HSwZgwFak
         CkK7KFmwJeXoN7K0dK5Um+z8ynnV4cuCR6tjR3s5Q8jpZtAlIYW2LTmhoUFdOjW+f1kJ
         4hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=GubrMrhiQBFWJBN2XcahtUhKA2h3c2cQmbRbLm9sXaE=;
        b=LRPJ06xjhccxgitgHuiJKv2h8zz5bs+I2G+Y8cAEQAlDcC/qU6/EVKUmGTavCJEY/2
         cmwG9vCCyJyUaKqlTEPlKlD4XXrU6MA2MYAsEnvENxxgr/68RLlwOpbG1PWyOur92FFf
         dnMjkJX3fd1+49Dx8Yovn+1GzInpVlYOgSJI9IQNYbjlWBXzLiYsT1pEbMgCmIzo2eL3
         P3/11aXw9woiNWg4Un0I2GvNDIZWk7MpQK66cPDEm+NvqReVzGxL/RjeWmTlYCfMuTmF
         NLBwKNUrGD62RCrTe79Mpz1VjXWbI+fcvHr47805kTvVjlQ/8lJMEqdFN3E651BhjFkq
         3nrA==
X-Gm-Message-State: AOAM532ADwyJp/24Is2F3C116YKCL6UJJ4TjVmj0rYF5WZAVxKHbmWQE
        NpaFOOrf92Kp29E8Fz2m/M8zUi3jx0Yv+/AEtw4=
X-Google-Smtp-Source: ABdhPJxzZZDsp1JCnfTSNpnC3viHIVd+9aXfVs8Hx12qtMzfb651wj2tuho4y0Dn+04qh0O4oGnwovFE9175MNHIloE=
X-Received: by 2002:a25:d348:: with SMTP id e69mr1635004ybf.273.1599821937219;
 Fri, 11 Sep 2020 03:58:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:e60d:0:0:0:0:0 with HTTP; Fri, 11 Sep 2020 03:58:56
 -0700 (PDT)
Reply-To: mrs.esthernicolas@yahoo.com
From:   "Mrs. Esther Nicolas" <atmcarddepartmentbtci.tg@gmail.com>
Date:   Fri, 11 Sep 2020 03:58:56 -0700
Message-ID: <CACLRigab+VOcsWAY=L8C=xzR3SSr6OOo5aE80=y_dwmbUDxusQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Liebste in Christus,
Mit geb=C3=BChrendem Respekt und Menschlichkeit war ich gezwungen, Ihnen
aus humanit=C3=A4ren Gr=C3=BCnden zu schreiben. Ich hei=C3=9Fe Frau Esther =
Nicolas.
Ich wurde in Arizona, Phoenix, geboren und bin mit Jacob Nicolas
Direktor Jacon Industry Togo verheiratet. Wir waren sechsunddrei=C3=9Fig
Jahre ohne Kind verheiratet. Er starb nach einer
Herzarterienoperation. Und k=C3=BCrzlich sagte mir mein Arzt, dass ich
aufgrund meines Krebsproblems (Leberkrebs und Schlaganfall) die
n=C3=A4chsten sechs Monate nicht durchhalten w=C3=BCrde. Bevor mein Mann le=
tztes
Jahr starb, hat er diese Summe von zwei Millionen achthunderttausend
Dollar bei einer Bank hier in Togo hinterlegt. Derzeit ist dieses Geld
noch auf der Bank. Nachdem ich meinen Zustand gekannt hatte, beschloss
ich, diesen Fonds an jeden guten gottesf=C3=BCrchtigen Bruder oder jede
gute gottesf=C3=BCrchtige Schwester zu spenden, die diesen Fonds so
verwenden wird, wie ich es hier anweisen werde. Ich m=C3=B6chte jemanden,
der diesen Fonds gem=C3=A4=C3=9F dem Wunsch meines verstorbenen Mannes nutz=
t, um
weniger privilegierten Menschen, Waisenh=C3=A4usern, Witwen und der
Verbreitung des Wortes Gottes zu helfen. Ich habe diese Entscheidung
getroffen, weil ich kein Kind habe, das diesen Fonds erben wird, und
ich m=C3=B6chte keinen Weg, wie dieses Geld auf gottlose Weise verwendet
wird. Aus diesem Grund entscheide ich mich, Ihnen diesen Fonds zu
=C3=BCbergeben. Ich habe keine Angst vor dem Tod, daher wei=C3=9F ich, wohi=
n ich
gehe. Ich m=C3=B6chte, dass Sie sich in meinen t=C3=A4glichen Gebeten wegen
meiner bevorstehenden Krebsoperation immer an mich erinnern. Wenn Sie
Ihre Antwort so schnell wie m=C3=B6glich zur=C3=BCckschreiben, kann ich ein=
e
andere Person f=C3=BCr denselben Zweck finden, in der Hoffnung, so schnell
wie m=C3=B6glich von Ihnen zu lesen. Gott segne Sie, wenn Sie auf die
Stimme der Argumentation h=C3=B6ren, Frau Esther Nicolas.
