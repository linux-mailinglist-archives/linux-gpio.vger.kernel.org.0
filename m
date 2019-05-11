Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D9F1A995
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2019 23:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfEKVTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 May 2019 17:19:38 -0400
Received: from sonic316-54.consmr.mail.ne1.yahoo.com ([66.163.187.180]:34652
        "EHLO sonic316-54.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726043AbfEKVTi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 May 2019 17:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1557609576; bh=hm2eWSdcZt5qZGI06OGG2BnJIZ3Akb6O3ATKED243Uc=; h=Date:From:Reply-To:Subject:References:From:Subject; b=TADZuzB5POJexp/7WkMBkZQRbpOyztkRnWweiuCoYFhU4HpVPzhEFQ6CqcbnGfcf1EvGZZg0p8fj1AXaoj3T4goC2OFc3MzZKTNe/P2xjp9Oxl3y4RRyZPIZOo2AI8MqSPgmXBKBgjYmaPWS7c+T9hMRmC8ULFonDr3XGIo9YorQ1xQMqnI8sq3e6QJxNnx9izWfSOZ+pKiUbgNa31TAM8Pisvpo856fgdyukGvh5II/p4sCcUGndD+RtZZtZbWZ5kkHaItJ3B/77O8UjVtEYAtnc5v2l5D5zUxYeqqvfzP4FQkiOQnhniqV9i1BoaWH9VNiwIFPB6tCpAeQemtw5Q==
X-YMail-OSG: ZUbkZyUVM1nzCPzlYbcR9yWStLJLAxPQd_cQdiiGxiwVch8ojG9kdCrAccncYSt
 P.bXFKZLlnu0X3QmPKsxLG0fsE9SCgvW3OfIJtqpJmgFbv7aNCif1kkgKAoSPeiW6yA1DkKjZFkl
 qbBqG32JLPNiOSRrJGy9INhjqp7b7SSCaDM2JTuMGqkb01yyAVEn_u7iJN6AkdiWXUVt6ySWypze
 gcRWwn.Isz07ApBHIy6GVtpsR_UTmHvPvK00oBh1TZF.dETOP5uufupP.R2RA_PaPt5FXtoLOgAq
 jElEuGJs2iOANefzjCm02JUpIJe6YYXsH8e1HFJY8m8ow8s8CAMb5bPLMfrKjhgLjdgCGVFIg7KY
 3fEO0qJCDOB4P_HGK62wP5WNMLisqtgPQmhhKwKTcUK9N6VnxnR8QCpFfB5qcRD1aZRkpNjBFuKx
 3keXOUKOcuHODc1rNNVKSB6sbsKtdaZWTrBmJdtDbAQDNBDjAElSCgoyE05wAFvhU2A_4lxvfcsI
 GDAtELWh5CxocaW7t9fbZ08.0SWUvNmULyFzyVd2beq2zdJ4MoGUVrvufCbwNO6zQq1zOLNto3xR
 VU1JB8UxsVpuoxSaFbgFEHIpU5OB07VCuNRj7G4pyTdDoeGPSnXnggGfQSO.0R4SZUJqRwWIa.fQ
 0ZR5at_Fi57oqmwfMq.OUmyDTANlwQ3BXgAAyHAnYJAxvq1oIBJf.kk32NGrrZlFjzT_eXbl0u5q
 _V_AZ06DKlKbcMSvz2756FeMHhUz5BVmTufOsPZ9RuJrrHCeviOq6NplNaIHuMWqEZmO_sAGPaxs
 571cKy3qtGrnBFQk0jRQvxlHscvv_S1FUSduqiszAh0s3yRRNmGOGZgQBqbi3TwM_IS.VYRWSrdv
 Y8JGGrPGOf9GV7oyxz0gCr_8FOIr9WLAuOJTXgvrPR0_NYIcr1d2I0RaxXjVTZo8mUyDW3CVa0Ew
 kaf3M4uIyqXo9gJ3PAdLVaERRCxcyMqW.wuxh35LAEci2JYy7MVfdvENeUuAprdlCmm7LQc0QJB1
 cBPaWcO2O2qJek29vTUyB1EjYmj9xj3Zoz0Yr7Q_1KI839mLbjpxI1ZGEFwXPwsRLmYko5nnUC8i
 yFCocAz2706NNyh_pLU7AHW7e2ythNRNg2vBskRvpT9iPrdmmmYN8bjgDVU778Dmr6Jq36KkSNHW
 4QVxRzdVcurJJRthmtHYuFs2oGzJ8m.8MqVO6gDfne4o-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sat, 11 May 2019 21:19:36 +0000
Date:   Sat, 11 May 2019 21:17:35 +0000 (UTC)
From:   Major Dennis Hornbeck <cd43@gamtm.online>
Reply-To: Major Dennis Hornbeck <hornbeckmajordennis637@gmail.com>
Message-ID: <1485784066.817036.1557609455556@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1485784066.817036.1557609455556.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13634 YahooMailBasic Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


I am in the military unit here in Afghanistan, we have some amount of funds that we want to move out of the country. My partners and I need a good partner someone we can trust. It is risk free and legal. Reply to this email: hornbeckmajordennis637@gmail.com

Regards,
Major Dennis Hornbeck.
